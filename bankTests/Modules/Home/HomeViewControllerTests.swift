//
//  HomeViewControllerTests.swift
//  bankTests
//
//  Created by Benjamin Cante on 20/10/2021.
//

import XCTest
@testable import bank

class HomeViewControllerTests: XCTestCase {
    
    var viewController: HomeViewController? {
        let storyboard = UIStoryboard(name: HomeContract.storyboardName, bundle: nil)
        let nc = storyboard.instantiateInitialViewController() as? UINavigationController
        let vc = nc?.viewControllers.first as? HomeViewController
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
