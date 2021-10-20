//
//  AccountTableViewCellPresenterTests.swift
//  bankTests
//
//  Created by Benjamin Cante on 20/10/2021.
//

import XCTest
@testable import bank

class AccountTableViewCellPresenterTests: XCTestCase {
    
    var viewProtocol: AccountTableViewMock!
    var presenter: AccountTableViewCellPresenter?
    let viewModel = AccountViewModel(id: UUID(),
                                     label: "",
                                     number: "",
                                     amount: 0.0,
                                     transactionsCount: 0)

    override func setUpWithError() throws {
        viewProtocol = AccountTableViewMock()
        presenter = AccountTableViewCellPresenter(viewProtocol: viewProtocol)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testUpdate() {
        presenter?.update(withViewModel: viewModel)
        XCTAssert(viewProtocol.setComponentsCalled)
    }

}
