//
//  FeedLoader.swift
//  SinopacPaulyswen
//
//  Created by Paul Wen on 2022/7/13.
//

import Foundation

protocol FeedLoader{
    func load(completion: @escaping((Result<[FeedItem],Error>) -> Void))
}
