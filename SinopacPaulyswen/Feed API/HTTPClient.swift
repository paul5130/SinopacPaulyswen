//
//  HTTPClient.swift
//  SinopacPaulyswen
//
//  Created by Paul Wen on 2022/7/14.
//

import Foundation

public typealias HTTPClientResult = Result<(Data, HTTPURLResponse), Error>
public protocol HTTPClient {
    func get(from url: URL, completion: @escaping ((HTTPClientResult) -> Void))
}
