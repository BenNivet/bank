//
//  AccountTableViewMock.swift
//  bankTests
//
//  Created by Benjamin Cante on 20/10/2021.
//

import Foundation
@testable import bank

class AccountTableViewMock: AccountTableViewCellProtocol {
    
    var setComponentsCalled = false
    
    func setComponents(viewModel: AccountViewModel) {
        setComponentsCalled = true
    }
    
}
