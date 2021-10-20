//
//  HomePresenter.swift
//  bank
//
//  Created by Benjamin Cante on 18/10/2021.
//

import Foundation

class HomePresenter {
    
    private var viewProtocol: HomeViewControllerProtocol?
    
    init(viewProtocol: HomeViewControllerProtocol) {
        self.viewProtocol = viewProtocol
    }
    
    private var viewModel: HomeViewModel {
        return HomeViewModel(accountButtonTitleKey: "Home.account_button.title")
    }
    
}

extension HomePresenter: HomePresenterProtocol {
    
    func manageViewDidLoad() {
        viewProtocol?.setComponents(viewModel: viewModel)
    }
    
    func manageDidPressButton() {
        viewProtocol?.goToAccountList()
    }
    
}
