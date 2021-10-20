//
//  AccountListContract.swift
//  bank
//
//  Created by Benjamin Cante on 18/10/2021.
//

import Foundation

struct AccountDetail {
    static let storyboardName = "AccountDetail"
}

protocol AccountDetailViewControllerProtocol {
    func setComponents(viewModel: AccountModel)
}

protocol AccountDetailPresenterProtocol {
    var viewModel: AccountModel? { get set }
    func manageViewDidLoad()
}
