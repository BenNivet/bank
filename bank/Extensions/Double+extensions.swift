//
//  Double+extensions.swift
//  bank
//
//  Created by Benjamin Cante on 18/10/2021.
//

import Foundation

extension Double {
    
    var formattedAmountString: String {
        return (floor(self) == self) ? String(format: "%.0f", self) : String(format: "%.2f", self)
    }
    
}
