//
//  AlbumListCellView.swift
//  ChartMatch
//
//  Created by Eunmo Yang on 2020/09/25.
//

import SwiftUI

struct AlbumListCellView: View {
    var album: Album
    
    var body: some View {
        HStack {
            Text("\(album.rank)")
                .foregroundColor(Color.primary)
                .font(.headline)
                .frame(width: 25.0)
            VStack(alignment: .leading) {
                Text(verbatim: album.name)
                    .foregroundColor(Color.primary)
                    .lineLimit(1)
                Text(verbatim: album.artist)
                    .font(.caption)
                    .foregroundColor(Color.secondary)
                    .lineLimit(1)
                    
                    
            }
        }
    }
}

struct AlbumListCellView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumListCellView(album: Album(id: "1", rank: 1, artist: "artist", name: "title", url: "url"))
    }
}
