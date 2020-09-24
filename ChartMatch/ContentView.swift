//
//  ContentView.swift
//  ChartMatch
//
//  Created by Eunmo Yang on 2020/09/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var currentSongs: CurrentSongs
    @State private var selected: Song?
    @State private var showAction = false
    
    var body: some View {
        List {
            Section(header: Text("Chart Match")) {
                Button("Refresh", action: { currentSongs.refresh()
                })
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
        }.actionSheet(isPresented: $showAction) {
            ActionSheet(title: Text("\(self.selected!.name)"),
                        message: Text("\(self.selected!.artist)"),
                        buttons: [
                            .default(Text("Play from this song")) {
                            },
                            .default(Text("Play just this song")) {
                            },
                            .cancel()
                        ]
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(CurrentSongs())
    }
}
