//
//  AccountListPresenter.swift
//  bank
//
//  Created by Benjamin Cante on 18/10/2021.
//

import Foundation

class AccountDetailPresenter {
    
    private var viewProtocol: AccountDetailViewControllerProtocol?
    var viewModel: AccountModel?
    
    init(viewProtocol: AccountDetailViewControllerProtocol) {
        self.viewProtocol = viewProtocol
    }
    
}

extension AccountDetailPresenter: AccountDetailPresenterProtocol {
    
    func manageViewDidLoad() {
        guard let viewModel = viewModel else { return }
        viewProtocol?.setComponents(viewModel: viewModel)
    }
    
}
