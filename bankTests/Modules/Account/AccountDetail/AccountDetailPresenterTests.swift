//
//  AccountDetailPresenterTests.swift
//  bankTests
//
//  Created by Benjamin Cante on 20/10/2021.
//

import XCTest
@testable import bank

class AccountDetailPresenterTests: XCTestCase {
    
    var viewProtocol: AccountDetailViewMock!
    var presenter: AccountDetailPresenter?
    
    override func setUpWithError() throws {
        viewProtocol = AccountDetailViewMock()
        presenter = AccountDetailPresenter(viewProtocol: viewProtocol)
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testManageViewDidLoad() {
        presenter?.viewModel = AccountModel(id: UUID(),
                                            amount: 0.0,
                                            type: "",
                                            label: "",
                                            owner: "",
                                            iban: "",
                                            subscriptionDate: "",
                                            legalInformations: "",
                                            number: "")
        presenter?.manageViewDidLoad()
        XCTAssert(viewProtocol.setComponentsCalled)
    }
    
}
