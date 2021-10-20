//
//  AccountListContract.swift
//  bank
//
//  Created by Benjamin Cante on 18/10/2021.
//

import Foundation

struct AccountList {
    static let storyboardName = "AccountList"
}

protocol AccountListViewControllerProtocol: Loadable {
    func setComponents(viewModel: AccountListViewModel)
    func reloadTableView()
    func showNoAccountView()
    func hideNoAccountView()
    func goToDetailAccount()
}

protocol AccountListPresenterProtocol {
    var accountsViewModel: [AccountViewModel] { get }
    var selectedAccount: AccountModel? { get }
    func manageViewDidLoad()
    func manageRefreshAccounts()
    func manageDidSelectAccount(at indexPath: IndexPath)
}

protocol AccountListManagerProtocol {
    func fetchAccounts(completion: @escaping ([AccountModel]) -> Void)
    func fetchOperation(id: UUID, completion: @escaping (Int) -> Void )
}
