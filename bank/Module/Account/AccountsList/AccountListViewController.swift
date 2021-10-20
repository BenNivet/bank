//
//  AccountListViewController.swift
//  bank
//
//  Created by Benjamin Cante on 18/10/2021.
//

import UIKit

class AccountListViewController: BankViewController {
    
    @IBOutlet weak var tableview: UITableView!
    
    private lazy var presenter: AccountListPresenterProtocol = {
        return AccountListPresenter(viewProtocol: self, manager: AccountListManager())
    }()
    
    var refreshControl: UIRefreshControl?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.manageViewDidLoad()
    }
    
}

//MARK: - AccountListViewControllerProtocol
extension AccountListViewController: AccountListViewControllerProtocol {
    
    func setComponents(viewModel: AccountListViewModel) {
        title = viewModel.accountListViewTitleKey.localized
        setupTableView()
        addRefreshControl()
    }
    
    private func setupTableView() {
        tableview.delegate = self
        tableview.dataSource = self
        tableview.rowHeight = UITableView.automaticDimension
        tableview.estimatedRowHeight = AccountTableView.estimatedRowHeight
        tableview.tableFooterView = UIView(frame: .zero)
        tableview.separatorInset = UIEdgeInsets.zero
        let cellNib = UINib(nibName: AccountTableView.cellIdentifier, bundle: nil)
        tableview.register(cellNib, forCellReuseIdentifier: AccountTableView.cellIdentifier)
    }
    
    func reloadTableView() {
        tableview.reloadData()
    }
    
    func showNoAccountView() {
        tableview.setBackgroundView(text: "AccountList.account_view.no_account".localized)
    }
    
    func hideNoAccountView() {
        tableview.removeBackgroundView()
    }
    
    func goToDetailAccount() {
        let storyboard = UIStoryboard(name: AccountDetail.storyboardName, bundle: nil)
        guard let vc = storyboard.instantiateInitialViewController() as? AccountDetailViewController else {
            return
        }
        vc.presenter.viewModel = presenter.selectedAccount
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

//MARK: - UIRefreshControl
extension AccountListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.accountsViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AccountTableView.cellIdentifier) as? AccountTableViewCell,
              presenter.accountsViewModel.indices.contains(indexPath.row) else {
                  return UITableViewCell()
              }
        
        cell.presenter.update(withViewModel: presenter.accountsViewModel[indexPath.row])
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = .white
        } else {
            cell.backgroundColor = Constants.mainColor?.withAlphaComponent(0.5)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.manageDidSelectAccount(at: indexPath)
    }
    
}

//MARK: - UIRefreshControl
extension AccountListViewController {
    
    func addRefreshControl() {
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(refresh), for: .valueChanged)
        tableview.refreshControl = refreshControl
    }
    
    @objc func refresh() {
        refreshControl?.beginRefreshing()
        presenter.manageRefreshAccounts()
        refreshControl?.endRefreshing()
    }
    
}
