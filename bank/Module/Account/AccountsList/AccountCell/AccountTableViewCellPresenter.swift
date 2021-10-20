//
//  AccountTableViewCellPresenter.swift
//  bank
//
//  Created by Benjamin Cante on 18/10/2021.
//

import Foundation
import UIKit

class AccountTableViewCellPresenter {
    
    private var viewProtocol: AccountTableViewCellProtocol?
    var viewModel: AccountViewModel?

    init(viewProtocol: AccountTableViewCellProtocol) {
        self.viewProtocol = viewProtocol
    }
    
}

extension AccountTableViewCellPresenter: AccountTableViewCellPresenterProtocol {
    
    func update(withViewModel viewModel: AccountViewModel) {
        self.viewModel = viewModel
        viewProtocol?.setComponents(viewModel: viewModel)
    }
    
}
