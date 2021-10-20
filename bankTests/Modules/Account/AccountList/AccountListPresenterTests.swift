//
//  AccountListPresenterTests.swift
//  bankTests
//
//  Created by Benjamin Cante on 20/10/2021.
//

import XCTest
@testable import bank

class AccountListPresenterTests: XCTestCase {
    
    var viewProtocol: AccountListViewMock!
    var presenter: AccountListPresenter?
    var manager: AccountListManagerMock!

    override func setUpWithError() throws {
        viewProtocol = AccountListViewMock()
        manager = AccountListManagerMock()
        presenter = AccountListPresenter(viewProtocol: viewProtocol, manager: manager)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testManageViewDidLoadNoAccount() {
        presenter?.manageViewDidLoad()
        XCTAssert(viewProtocol.setComponentsCalled)
        fetchAccountsTestsNoAccount()
    }
    
    func testManageViewDidLoadWithAccounts() {
        let result = createAccountModel(id: UUID())
        manager.fetchAccountsResult = [result]
        presenter?.manageViewDidLoad()
        XCTAssert(viewProtocol.setComponentsCalled)
        fetchAccountsTestsWithAccounts()
    }
    
    func testManageRefreshAccountsNoAccounts() {
        presenter?.manageRefreshAccounts()
    }
    
    func testManageRefreshAccountsWithAccounts() {
        let result = createAccountModel(id: UUID())
        manager.fetchAccountsResult = [result]
        presenter?.manageRefreshAccounts()
        fetchAccountsTestsWithAccounts()
    }
    
    func testManageDidSelectAccountMissingIndex() {
        presenter?.manageDidSelectAccount(at: IndexPath(row: 0, section: 0))
        XCTAssert(!viewProtocol.goToDetailAccountCalled)
    }
    
    func testManageDidSelectAccountExistingIndex() {
        let result = createAccountModel(id: UUID())
        manager.fetchAccountsResult = [result]
        presenter?.manageRefreshAccounts()
        
        let expectation = expectation(description: "expectation")
        DispatchQueue.main.async {
            expectation.fulfill()
        }
                
        wait(for: [expectation], timeout: 5.0)
        
        presenter?.manageDidSelectAccount(at: IndexPath(row: 0, section: 0))
        XCTAssert(viewProtocol.goToDetailAccountCalled)
    }
    
    func testManageDidSelectAccountFakeIndex() {
        presenter?.manageDidSelectAccount(at: IndexPath(row: -4, section: -8))
        XCTAssert(!viewProtocol.goToDetailAccountCalled)
    }

}

extension AccountListPresenterTests {
    
    private func createAccountModel(id: UUID) -> AccountModel {
        return AccountModel(id: id,
                            amount: 0.0,
                            type: "",
                            label: "",
                            owner: "",
                            iban: "",
                            subscriptionDate: "",
                            legalInformations: "",
                            number: "")
    }
    
    private func fetchAccountsTestsNoAccount() {
        XCTAssert(manager.fetchAccountsCalled)
        
        let expectation = expectation(description: "expectation")
        DispatchQueue.main.async {
            expectation.fulfill()
        }
                
        wait(for: [expectation], timeout: 5.0)
        
        XCTAssert(viewProtocol.reloadTableViewCalled)
        
        XCTAssert(viewProtocol.showNoAccountViewCalled)
        XCTAssert(!viewProtocol.hideNoAccountViewCalled)
    }
    
    private func fetchAccountsTestsWithAccounts() {
        XCTAssert(manager.fetchAccountsCalled)
        
        let expectation = expectation(description: "expectation")
        DispatchQueue.main.async {
            expectation.fulfill()
        }
                
        wait(for: [expectation], timeout: 5.0)
        
        XCTAssert(viewProtocol.reloadTableViewCalled)
        
        XCTAssert(!viewProtocol.showNoAccountViewCalled)
        XCTAssert(viewProtocol.hideNoAccountViewCalled)
    }
    
}
