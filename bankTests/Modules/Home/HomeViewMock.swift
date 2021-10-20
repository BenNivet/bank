//
//  HomeViewMock.swift
//  bankTests
//
//  Created by Benjamin Cante on 20/10/2021.
//

import Foundation
@testable import bank

class HomeViewMock: HomeViewControllerProtocol {
    
    var setComponentsCalled = false
    var goToAccountListCalled = false
    
    func setComponents(viewModel: HomeViewModel) {
        setComponentsCalled = true
    }
    
    func goToAccountList() {
        goToAccountListCalled = true
    }
    
}
