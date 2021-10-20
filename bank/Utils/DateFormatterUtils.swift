//
//  DateFormatterUtils.swift
//  bank
//
//  Created by Benjamin Cante on 19/10/2021.
//

import Foundation

class DateFormatterUtils {
    
    static let shared = DateFormatterUtils()
    
    lazy var serverDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Constants.serverDateFormat
        return dateFormatter
    }()
    
    lazy var viewDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Constants.viewDateFormat
        return dateFormatter
    }()
    
}
