//
//  MediaViewModel.swift
//  iTunesApp
//
//  Created by Giovanni Noa on 8/13/19.
//  Copyright © 2019 Giovanni Noa. All rights reserved.
//

import Foundation

class MediaViewModel: ObservableObject {
    @Published var mediaItems = [MediaItem]()
    
    init() {
      fetchItems()
    }
    
    func fetchItems() {
        let dataTaskPublisher = iTunesAPI.dataTaskPublisher(for: .movies)
            .map { $0.data }
            .decode(type: Welcome.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { _ in
                
            }) { (response) in
                let items = response.feed.results.map { item in
                    MediaItem(title: item.name, imageURL: item.artworkUrl100, mediaType: .movies)
                }
                self.mediaItems = items
        }
    }
}
