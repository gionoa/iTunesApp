//
//  ContentView.swift
//  iTunesApp
//
//  Created by Giovanni Noa on 8/10/19.
//  Copyright © 2019 Giovanni Noa. All rights reserved.
//

import SwiftUI

struct MediaListView: View {
    @ObservedObject var mediaViewModel = MediaViewModel()
    
    var body: some View {
        NavigationView {
            List(mediaViewModel.mediaItems) { mediaItem in
                Text(mediaItem.title)
            }
            .navigationBarTitle("iTunes Media")
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
