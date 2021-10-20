//
//  AccountListManager.swift
//  bank
//
//  Created by Benjamin Cante on 18/10/2021.
//

import Foundation

class AccountListManager: AccountListManagerProtocol {
    
    func fetchAccounts(completion: @escaping ([AccountModel]) -> Void) {
        DispatchQueue.global().async {
            WebServiceManager.shared.getAccounts { accounts in
                completion(accounts.compactMap({ AccountModel(id: $0.id,
                                                              amount: $0.amount,
                                                              type: $0.type.label,
                                                              label: $0.label,
                                                              owner: $0.owner,
                                                              iban: $0.iban,
                                                              subscriptionDate: $0.subscriptionDate,
                                                              legalInformations: $0.legalInformations,
                                                              number: $0.number) }))
            }
        }
    }
    
    func fetchOperation(id: UUID, completion: @escaping (Int) -> Void ) {
        WebServiceManager.shared.getAccountOperations(id: id) { operations in
            completion(operations.count)
        }
    }
    
}
