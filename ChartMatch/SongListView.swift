//
//  SongListView.swift
//  ChartMatch
//
//  Created by Eunmo Yang on 2020/09/25.
//

import SwiftUI

struct SongListView: View {
    @EnvironmentObject private var songs: CurrentSongs
    var title: String
    
    var body: some View {
        List {
            Section {
                if songs.loading {
                    Text("Loading...")
                } else {
                    Button("Refresh") {
                        songs.refresh()
                    }
                }
                if !songs.songs.isEmpty {
                    Button("Add to queue") {
                        queueSongs(songs.songs)
                    }
                }
            }
            Section(header: Text("Singles")) {
                ForEach(songs.songs) { song in
                    Button(action: {
                        playSongs(songs.songsFrom(song))
                    }) {
                        SongListCellView(song: song)
                    }
                }
            }
        }
        .navigationBarTitle(Text(verbatim: title))
    }
}

struct SongListView_Previews: PreviewProvider {
    static var previews: some View {
        SongListView(title: "Title").environmentObject(CurrentSongs(.current))
    }
}
