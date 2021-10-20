//
//  AccountListManagerMock.swift
//  bankTests
//
//  Created by Benjamin Cante on 20/10/2021.
//

import Foundation
@testable import bank

class AccountListManagerMock: AccountListManagerProtocol {
    
    var fetchAccountsResult = [AccountModel]()
    var fetchOperationResult = 0
    
    var fetchAccountsCalled = false
    var fetchOperationCalled = false
    
    func fetchAccounts(completion: @escaping ([AccountModel]) -> Void) {
        fetchAccountsCalled = true
        completion(fetchAccountsResult)
    }
    
    func fetchOperation(id: UUID, completion: @escaping (Int) -> Void) {
        fetchOperationCalled = true
        completion(fetchOperationResult)
    }
    
}
