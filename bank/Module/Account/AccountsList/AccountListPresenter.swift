//
//  AccountListPresenter.swift
//  bank
//
//  Created by Benjamin Cante on 18/10/2021.
//

import Foundation

class AccountListPresenter {
    
    private var viewProtocol: AccountListViewControllerProtocol?
    private var manager: AccountListManagerProtocol?
    private var accounts = [AccountModel]() {
        didSet {
            accountsViewModel = accounts.compactMap({ AccountViewModel(id: $0.id,
                                                                       label: $0.label,
                                                                       number: $0.number,
                                                                       amount: $0.amount,
                                                                       transactionsCount: nil) })
        }
    }
    var accountsViewModel = [AccountViewModel]() {
        didSet {
            viewProtocol?.reloadTableView()
            accountsViewModel.isEmpty ? viewProtocol?.showNoAccountView() : viewProtocol?.hideNoAccountView()
        }
    }
    var selectedAccount: AccountModel?
    
    init(viewProtocol: AccountListViewControllerProtocol, manager: AccountListManagerProtocol) {
        self.viewProtocol = viewProtocol
        self.manager = manager
    }
    
    private var viewModel: AccountListViewModel {
        return AccountListViewModel(accountListViewTitleKey: "AccountList.account_view.title")
    }
    
}

//MARK: - AccountListPresenterProtocol
extension AccountListPresenter: AccountListPresenterProtocol {
    
    func manageViewDidLoad() {
        viewProtocol?.setComponents(viewModel: viewModel)
        manageRefreshAccounts()
    }
    
    func manageRefreshAccounts() {
        fetchAccounts()
    }
    
    func manageDidSelectAccount(at indexPath: IndexPath) {
        guard accounts.indices.contains(indexPath.row) else { return }
        selectedAccount = accounts[indexPath.row]
        viewProtocol?.goToDetailAccount()
    }
    
    private func fetchAccounts() {
        viewProtocol?.showLoader()
        manager?.fetchAccounts(completion: { [weak self] accounts in
            DispatchQueue.main.async {
                self?.viewProtocol?.hideLoader()
                self?.accounts = accounts
                self?.fetchOperations()
            }
        })
    }
    
    private func fetchOperations() {
        for account in self.accounts {
            self.manager?.fetchOperation(id: account.id, completion: { [weak self] transactionsCount in
                DispatchQueue.main.async {
                    self?.updateAccount(withId: account.id, transactionsCount: transactionsCount)
                }
            })
        }
    }
    
    private func updateAccount(withId id: UUID, transactionsCount: Int ) {
        accountsViewModel = accountsViewModel.compactMap({
            var acc = $0
            if $0.id == id {
                acc.transactionsCount = transactionsCount
            }
            return acc
        })
    }
}
