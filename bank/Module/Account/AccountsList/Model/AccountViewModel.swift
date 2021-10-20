//
//  AccountModel.swift
//  bank
//
//  Created by Benjamin Cante on 18/10/2021.
//

import Foundation

struct AccountViewModel {
    
    var id: UUID
    var label: String
    var number: String
    var amount: Double
    var transactionsCount: Int?
    
}
