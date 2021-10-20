//
//  AccountListViewControllerTests.swift
//  bankTests
//
//  Created by Benjamin Cante on 20/10/2021.
//

import XCTest
@testable import bank

class AccountListViewControllerTests: XCTestCase {
    
    var viewController: AccountListViewController? {
        let storyboard = UIStoryboard(name: AccountList.storyboardName, bundle: nil)
        let vc = storyboard.instantiateInitialViewController() as? AccountListViewController
        vc?.loadViewIfNeeded()
        return vc
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testLoadVC() {
        XCTAssert(viewController != nil)
    }
    
}
