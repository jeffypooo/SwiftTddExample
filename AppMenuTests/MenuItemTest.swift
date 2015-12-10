//
//  MenuItemTest.swift
//  AppMenu
//
//  Created by Jeff Jones on 12/9/15.
//  Copyright © 2015 Jeff Jones. All rights reserved.
//

import XCTest
import UIKit

class MenuItemTest: XCTestCase {
    
    let testTitle = "Test Title"
    var item : MenuItem?
    
    override func setUp() {
        super.setUp()
        item = getMenuItemWithTitle(testTitle)
    }
    
   
    func testShouldHaveTitle() {
        XCTAssertEqual(item!.title, testTitle, "Should have title")
    }
    
    func testShouldAssignSubtitle() {
        let expectedSubtitle = "test subtitle"
        item!.subTitle = expectedSubtitle
        XCTAssertEqual(item!.subTitle, expectedSubtitle, "Should have set subtitle")
    }
    
    func testShouldAssignIconName() {
        let expectedName = "test name"
        item!.iconName = expectedName
        XCTAssertEqual(item!.iconName, expectedName, "Should have assigned icon name")
    }
    
    private func getMenuItemWithTitle(title: String) -> MenuItem {
        return MenuItem(title: title)
    }
    
}
