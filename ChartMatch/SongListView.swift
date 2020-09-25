//
//  SongListView.swift
//  ChartMatch
//
//  Created by Eunmo Yang on 2020/09/25.
//

import SwiftUI

struct SongListView: View {
    @EnvironmentObject private var currentSongs: CurrentSongs
    @State private var selected: Song?
    @State private var showAction = false
    
    var body: some View {
        List {
            Section {
                if currentSongs.loading {
                    Text("Loading...")
                } else {
                    Button("Refresh") {
                        currentSongs.refresh()
                    }
                }
            }
            Section(header: Text("Singles")) {
                ForEach(currentSongs.songs) { song in
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
                        playSongs(currentSongs.songsFrom(self.selected!))
                    },
                    .default(Text("Play just this song")) {
                        playSongs([self.selected!])
                    },
                    .cancel()
                ]
            )
        }
        .navigationBarTitle(Text("Current Singles"))
    }
}

struct SongListView_Previews: PreviewProvider {
    static var previews: some View {
        SongListView().environmentObject(CurrentSongs())
    }
}
