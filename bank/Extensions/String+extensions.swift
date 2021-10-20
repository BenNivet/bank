//
//  String+extensions.swift
//  bank
//
//  Created by Benjamin Cante on 18/10/2021.
//

import Foundation

extension String {
    
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
    
    var formattedDate: String {
        if let date = DateFormatterUtils.shared.serverDateFormatter.date(from: self) {
            return DateFormatterUtils.shared.viewDateFormatter.string(from: date)
        }
        
        return self
    }
    
}
