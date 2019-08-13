//
//  ContentView.swift
//  iTunesApp
//
//  Created by Giovanni Noa on 8/10/19.
//  Copyright © 2019 Giovanni Noa. All rights reserved.
//

import SwiftUI

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

struct MediaListView: View {
    @ObservedObject var mediaViewModel = MediaViewModel()
    
    var body: some View {
        List(mediaViewModel.mediaItems) { mediaItem in
            Text(mediaItem.title)
        }
            .onAppear {
                print("YO")
                print(self.mediaViewModel.mediaItems)
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MediaListView()
    }
}
#endif
