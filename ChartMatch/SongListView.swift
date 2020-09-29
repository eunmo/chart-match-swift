//
//  SongListView.swift
//  ChartMatch
//
//  Created by Eunmo Yang on 2020/09/25.
//

import SwiftUI

struct SongListView: View {
    @EnvironmentObject private var songs: CurrentSongs
    @State private var selected: Song?
    @State private var showAction = false
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
            }
            Section(header: Text("Singles")) {
                ForEach(songs.songs) { song in
                    Button(action: {
                        self.selected = song
                        self.showAction = true
                    }) {
                        SongListCellView(song: song)
                    }
                }
            }
        }
        .actionSheet(isPresented: $showAction) {
            ActionSheet(
                title: Text("\(self.selected!.name)"),
                message: Text("\(self.selected!.artist)"),
                buttons: [
                    .default(Text("Play from this song")) {
                        playSongs(songs.songsFrom(self.selected!))
                    },
                    .default(Text("Play just this song")) {
                        playSongs([self.selected!])
                    },
                    .cancel()
                ]
            )
        }
        .navigationBarTitle(Text(verbatim: title))
    }
}

struct SongListView_Previews: PreviewProvider {
    static var previews: some View {
        SongListView(title: "Title").environmentObject(CurrentSongs(.current))
    }
}
