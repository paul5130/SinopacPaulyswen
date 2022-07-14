//
//  RemoteFeedLoader.swift
//  SinopacPaulyswen
//
//  Created by Paul Wen on 2022/7/14.
//

import Foundation

public typealias HTTPClientResult = Result<(Data, HTTPURLResponse), Error>
public protocol HTTPClient {
    func get(from url: URL, completion: @escaping ((HTTPClientResult) -> Void))
}

public final class RemoteFeedLoader {
    private let url: URL
    private let client: HTTPClient
    public enum Error: Swift.Error {
        case connectivity
        case invalidData
    }

//    public enum Result: Equatable {
//        case success([FeedItem])
//        case failure(Error)
//    }

    public init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }

    public func load(completion: @escaping (Result<[FeedItem],RemoteFeedLoader.Error>) -> Void) {
        client.get(from: url) { result in
            switch result {
            case let .success((data,response)):
                do {
                    let items = try FeedItemsMapper.map(data, response)
                    completion(.success(items))
                }catch{
                    completion(.failure(.invalidData))
                }
            case .failure:
                completion(.failure(.connectivity))
            }
        }
    }
}

private enum FeedItemsMapper {
    private struct Root: Decodable {
        let items: [Item]
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

        static func map(_ data: Data, _ response: HTTPURLResponse) throws -> [FeedItem] {
            guard response.statusCode == OK_200 else {
                throw RemoteFeedLoader.Error.invalidData
            }

            let root = try JSONDecoder().decode(Root.self, from: data)
            return root.items.map { $0.item }
        }
}
