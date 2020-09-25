//
//  AlbumListView.swift
//  ChartMatch
//
//  Created by Eunmo Yang on 2020/09/25.
//

import SwiftUI

struct AlbumListView: View {
    @EnvironmentObject private var currentAlbums: CurrentAlbums
    
    var body: some View {
        List {
            Section {
                if currentAlbums.loading {
                    Text("Loading...")
                } else {
                    Button("Refresh") {
                        currentAlbums.refresh()
                    }
                }
            }
            Section(header: Text("Albums")) {
                ForEach(currentAlbums.albums) { album in
                    Link(destination: URL(string: album.url)!) {
                        AlbumListCellView(album: album)
                    }
                }
            }
        }
        .navigationBarTitle(Text("Current Albums"))
    }
}

struct AlbumListView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumListView()
    }
}
