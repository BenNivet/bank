//
//  AccountModel.swift
//  bank
//
//  Created by Benjamin Cante on 18/10/2021.
//

import Foundation

struct AccountModel {
    
    var id: UUID
    var amount: Double
    var type: String
    var label: String
    var owner: String
    var iban: String
    var subscriptionDate: String
    var legalInformations: String
    var number: String
    
}
