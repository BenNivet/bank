//
//  AccountDetailViewMock.swift
//  bankTests
//
//  Created by Benjamin Cante on 20/10/2021.
//

import Foundation
@testable import bank

class AccountDetailViewMock: AccountDetailViewControllerProtocol {
    
    var setComponentsCalled = false
    
    func setComponents(viewModel: AccountModel) {
        setComponentsCalled = true
    }
    
}
