//
//  SongListCellView.swift
//  ChartMatch
//
//  Created by Eunmo Yang on 2020/09/24.
//

import SwiftUI

struct SongListCellView: View {
    var song: Song
    
    var body: some View {
        HStack {
            Text("\(song.rank)")
                .font(.headline)
                .frame(width: 25.0)
            VStack(alignment: .leading) {
                Text(verbatim: song.name)
                    .lineLimit(1)
                Text(verbatim: song.artist)
                    .font(.caption)
                    .foregroundColor(Color.gray)
                    .lineLimit(1)
                    
                    
            }
        }
    }
}

struct SongListCellView_Previews: PreviewProvider {
    static var previews: some View {
        SongListCellView(song: Song(id: "1", rank: 1, artist: "Artist", name: "Title"))
    }
}
