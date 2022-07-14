//
//  FeedLoader.swift
//  SinopacPaulyswen
//
//  Created by Paul Wen on 2022/7/13.
//

import Foundation

public typealias LoadFeedResult = (Result<[FeedItem],Error>)

public protocol FeedLoader{
    func load(completion: @escaping(LoadFeedResult) -> Void)
}
