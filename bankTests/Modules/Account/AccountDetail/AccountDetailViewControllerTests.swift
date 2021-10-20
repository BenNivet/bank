//
//  AccountDetailViewControllerTests.swift
//  bankTests
//
//  Created by Benjamin Cante on 20/10/2021.
//

import XCTest
@testable import bank

class AccountDetailViewControllerTests: XCTestCase {
    
    var viewController: AccountDetailViewController? {
        let storyboard = UIStoryboard(name: AccountDetail.storyboardName, bundle: nil)
        let vc = storyboard.instantiateInitialViewController() as? AccountDetailViewController
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
