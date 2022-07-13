//
//  RemoteFeedLoaderTest.swift
//  SinopacPaulyswenTests
//
//  Created by Paul Wen on 2022/7/13.
//

import XCTest

class RemoteFeedLoader{}

class HTTPClient{
    var requestedURL: URL?
}

class RemoteFeedLoaderTests: XCTestCase{
    func test_init_doesNotRequestDataFromURL(){
        let client = HTTPClient()
        _ = RemoteFeedLoader()
        
        XCTAssertNil(client.requestedURL)
    }
}
