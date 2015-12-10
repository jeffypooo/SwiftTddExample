//
//  PlistEntryReader.swift
//  AppMenu
//
//  Created by Jeff Jones on 12/9/15.
//  Copyright © 2015 Jeff Jones. All rights reserved.
//

import XCTest
import UIKit

class PlistEntryReaderTest: XCTestCase {
    
    let badFileName: String = "foo"
    let goodFileName: String = "menuItems"
    let expectedEntryCount: Int = 3;
    var reader: PlistEntryReader?
    
    override func setUp() {
        super.setUp()
        reader = PlistEntryReader();
    }
    
    /* Read tests */
    
    func testShouldReadCorrectCollectionSize() {
        let metaData = readWithGoodFileAndGetData();
        XCTAssertTrue(metaData!.count == expectedEntryCount)
    }
    
    /* Error handling tests */
    
    func testShouldReturnErrorWithCorrectDomain() {
        let err = readWithBadFileAndGetError()
        let domain = err!.domain
        XCTAssertEqual(domain, PlistEntryReader.ErrorDomain, "Should return the correct error domain")
    }
    
    func testShouldReturnCorrectErrorCodeForBadFile() {
        let err = readWithBadFileAndGetError()
        assertErrorCode(err!, expected: PlistEntryReader.ReadError.FileNotFound.rawValue)
    }
    
    func testShouldReturnExpectedInfoInErrorForBadFile() {
        let err = readWithBadFileAndGetError()
        let expected = "\(badFileName).plist does not exist in app bundle."
        assertErrorDesc(err!, desc: expected)
    }
    
    /* Test helpers */
    
    private func assertErrorCode(err: NSError, expected: Int) {
        XCTAssertEqual(err.code, expected, "Expected error code to be \(expected)")
    }
    
    private func assertErrorDesc(err: NSError, desc: String) {
        let info = err.userInfo
        let errDescription = info[NSLocalizedDescriptionKey]! as! String
        XCTAssertEqual(errDescription, desc, "Expected description to be \(desc)")
    }
    
    private func readWithBadFileAndGetError() -> NSError? {
        let (_, err) = reader!.readItems(badFileName)
        return err
    }
    
    private func readWithGoodFileAndGetData() -> [[String : String]]? {
        let (data, _) = reader!.readItems(goodFileName)
        return data
    }
    
    
}