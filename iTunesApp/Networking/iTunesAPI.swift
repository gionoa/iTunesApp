//
//  iTunesAPI.swift
//  iTunesApp
//
//  Created by Giovanni Noa on 8/10/19.
//  Copyright © 2019 Giovanni Noa. All rights reserved.
//

import Foundation
import Combine

struct Welcome: Codable {
    let feed: Feed
}

struct Feed: Codable {
    let results: [Result]
}

struct Result: Codable {
    let name: String
    let artworkUrl100: String
}

enum NetworkingError: Error {
    case error(String)
}
struct iTunesAPI {
    static func dataTaskPublisher(for mediaType: MediaType) -> URLSession.DataTaskPublisher  {// -> Result<[MediaItem], Error> {
        let urlString = "https://rss.itunes.apple.com/api/v1/us/\(mediaType.query)/all/25/explicit.json"
        let url = URL(string: urlString)!
        
        return URLSession.shared.dataTaskPublisher(for: url)
//            .map { $0.data }
//            .decode(type: Welcome.self, decoder: JSONDecoder())
//            .receive(on: RunLoop.main)
//            .sink(receiveCompletion: { _ in
//
//            }) { (response) in
//                let items = response.feed.results.map { item in
//                    MediaItem(title: item.name, imageURL: item.artworkUrl100, mediaType: mediaType)
//                }
//
//                mediaItems = items
//        }
    
//            .tryCatch({ (error) -> Publisher in
//                return AnyPublisher<Any, Error>(Error)
//            })
//            .sink(receiveCompletion: { (completion) in
//                print(completion)
//            }) { (value) in
//                let items = value.feed.results.map { MediaItem(title: $0.name, imageURL: $0.artworkUrl100, mediaType: mediaType)}
//                return .success(items)
//                }
        
//
//        let cancellable = dataTask
//            .sink(receiveCompletion: { completion in
//                switch completion {
//                case .finished:
//                    print(completion)
//                case .failure(let error):
//                    dataTaskError = error.localizedDescription
//                }
//            }, receiveValue: { value in
//
//                items = value.feed.results.map { item in
//                    MediaItem(title: item.name, imageURL: item.artworkUrl100, mediaType: mediaType)
//
//                }
//                print(items)
//            })
//        return items.isEmpty == false ? .success(items) : .failure(NetworkingError.error(dataTaskError))
    }
}
