//
//  HomePresenterTests.swift
//  bankTests
//
//  Created by Benjamin Cante on 20/10/2021.
//

import XCTest
@testable import bank

class HomePresenterTests: XCTestCase {
    
    var viewProtocol: HomeViewMock!
    var presenter: HomePresenter?

    override func setUpWithError() throws {
        viewProtocol = HomeViewMock()
        presenter = HomePresenter(viewProtocol: viewProtocol)
    }

    override func tearDownWithError() throws {
        presenter = nil
    }

    func testManageViewDidLoad() {
        presenter?.manageViewDidLoad()
        XCTAssert(viewProtocol.setComponentsCalled)
        XCTAssert(!viewProtocol.goToAccountListCalled)
    }
    
    func testManageDidPressButton() {
        presenter?.manageDidPressButton()
        XCTAssert(!viewProtocol.setComponentsCalled)
        XCTAssert(viewProtocol.goToAccountListCalled)
    }
    
}
