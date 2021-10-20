//
//  AccountTableViewCellContract.swift
//  bank
//
//  Created by Benjamin Cante on 18/10/2021.
//

import Foundation

struct AccountTableView {
    static let storyboardName = "AccountTableViewCell"
    static let cellIdentifier = "AccountTableViewCell"
    static let estimatedRowHeight = 60.0
}

protocol AccountTableViewCellProtocol {
    func setComponents(viewModel: AccountViewModel)
}

protocol AccountTableViewCellPresenterProtocol {
    var viewModel: AccountViewModel? { get set }
    func update(withViewModel viewModel: AccountViewModel)
}
