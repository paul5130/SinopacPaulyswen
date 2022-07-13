//
//  Feeditem.swift
//  SinopacPaulyswen
//
//  Created by Paul Wen on 2022/7/13.
//

import Foundation

struct Filtered: Decodable{
    let pubDate: String
    let title: String
    let keywords: [String]
}
struct GetFeed: Decodable{
    let data: Data
    struct Data: Decodable{
        let filtered: [Filtered]
    }
}
