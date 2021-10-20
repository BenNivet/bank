//
//  AccountListViewMock.swift
//  bankTests
//
//  Created by Benjamin Cante on 20/10/2021.
//

import Foundation
@testable import bank

class AccountListViewMock: AccountListViewControllerProtocol {
    
    var setComponentsCalled = false
    var reloadTableViewCalled = false
    var showNoAccountViewCalled = false
    var hideNoAccountViewCalled = false
    var goToDetailAccountCalled = false
    
    func setComponents(viewModel: AccountListViewModel) {
        setComponentsCalled = true
    }
    
    func reloadTableView() {
        reloadTableViewCalled = true
    }
    
    func showNoAccountView() {
        showNoAccountViewCalled = true
    }
    
    func hideNoAccountView() {
        hideNoAccountViewCalled = true
    }
    
    func goToDetailAccount() {
        goToDetailAccountCalled = true
    }
    
    func showLoader() {}
    func hideLoader() {}
    
}
