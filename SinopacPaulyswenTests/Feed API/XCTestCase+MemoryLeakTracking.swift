//
//  XCTestCase+MemoryLeakTracking.swift
//  SinopacPaulyswenTests
//
//  Created by Paul Wen on 2022/7/14.
//

import XCTest

extension XCTestCase {
    func trackForMemoryLeaks(_ instance: AnyObject, file: StaticString = #filePath, line: UInt = #line) {
        addTeardownBlock { [weak instance] in
            XCTAssertNil(instance, "Instance should have been deallocated. Potential memory leak.", file: file, line: line)
        }
    }
}