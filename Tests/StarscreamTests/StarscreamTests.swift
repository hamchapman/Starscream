//
//  StarscreamTests.swift
//  StarscreamTests
//
//  Created by Austin Cherry on 9/25/14.
//  Copyright (c) 2014 Vluxe. All rights reserved.
//

import XCTest
@testable import Starscream

class StarscreamTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    let headerSecKey = "dGhlIHNhbXBsZSBub25jZQ=="
    let wsConst = "258EAFA5-E914-47DA-95CA-C5AB0DC85B11"

    func ct() -> String {
        let data = "\(headerSecKey)\(wsConst)".data(using: String.Encoding.utf8)!

        var digest = SHA1()
        let _ = try! digest.update(withBytes: data.bytes)
        let result = try! digest.finish()

        return Data(bytes: result).base64EncodedString()
    }

    func testExample() {
        let libVersion = "\(headerSecKey)\(wsConst)".sha1Base64()
        let cryptoSwiftVersion = ct()

        print(libVersion, " --- ", cryptoSwiftVersion)

        XCTAssertEqual(libVersion, cryptoSwiftVersion)
    }

}
