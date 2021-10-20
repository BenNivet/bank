//
//  WebServiceManager.swift
//  bank
//
//  Created by Benjamin Cante on 18/10/2021.
//

import Foundation
import AccountAPI

class WebServiceManager {
    
    static let shared = WebServiceManager()
    var accountServices = AccountServices()
    
    // MARK: - AccountAPI
    func getAccounts(completion: @escaping ([Account]) -> Void) {
        accountServices.getAccounts { accounts in
            //print(accounts)
            completion(accounts)
        }
    }
    
    func getAccountOperations(id: UUID, completion: @escaping ([AccountOperation]) -> Void) {
        accountServices.getAccountOperations(from: id) { operations in
            //print(operations)
            completion(operations)
        }
    }
    
}
