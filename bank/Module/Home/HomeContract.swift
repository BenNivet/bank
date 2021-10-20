//
//  HomeContract.swift
//  bank
//
//  Created by Benjamin Cante on 18/10/2021.
//

import Foundation

struct HomeContract {
    static let storyboardName = "Home"
}

protocol HomeViewControllerProtocol {
    func setComponents(viewModel: HomeViewModel)
    func goToAccountList()
}

protocol HomePresenterProtocol {
    func manageViewDidLoad()
    func manageDidPressButton()
}
