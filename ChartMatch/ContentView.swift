//
//  ContentView.swift
//  ChartMatch
//
//  Created by Eunmo Yang on 2020/09/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: SongListView(title: "Current Singles").environmentObject(CurrentSongs(.current))) {
                    Text("Current Singles")
                }
                NavigationLink(destination: AlbumListView().environmentObject(CurrentAlbums())) {
                    Text("Current Albums")
                }
                NavigationLink(destination: SongListView(title: "Random Shuffle").environmentObject(CurrentSongs(.shuffle))) {
                    Text("Random Shuffle")
                }
            }
            .navigationBarTitle(Text("Chart Match"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
