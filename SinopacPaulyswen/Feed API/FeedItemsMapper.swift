//
//  FeedItemsMapper.swift
//  SinopacPaulyswen
//
//  Created by Paul Wen on 2022/7/14.
//

import Foundation

final class FeedItemsMapper {
    private struct Root: Decodable {
        let items: [Item]
        var feed: [FeedItem]{
            items.map{ $0.item}
        }
    }

    private struct Item: Decodable {
        let id: UUID
        let description: String?
        let location: String?
        let image: URL

        var item: FeedItem {
            return FeedItem(id: id, description: description, location: location, imageURL: image)
        }
    }

    static var OK_200: Int { return 200 }

    static func map(_ data: Data, _ response: HTTPURLResponse) -> RemoteFeedLoader.Result {
        guard response.statusCode == OK_200,let root = try? JSONDecoder().decode(Root.self, from: data) else {
            return .failure(RemoteFeedLoader.Error.invalidData)
        }
        return .success(root.feed)
    }
}
