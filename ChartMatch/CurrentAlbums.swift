//
//  CurrentAlbums.swift
//  ChartMatch
//
//  Created by Eunmo Yang on 2020/09/25.
//

import Combine
import SwiftUI

struct Album: Hashable, Codable, Identifiable {
    var id: String
    var rank: Int
    var artist: String
    var name: String
    var url: String
}

final class CurrentAlbums: ObservableObject {
    @Published var albums: [Album] = []
    @Published var loading: Bool = false
    
    func refresh() -> Void {
        self.albums = []
        self.loading = true
        let urlAsString = "https://chart.eunmo.be/api/chart/current/album/jp"
        if let url = URL(string: urlAsString) {
            let urlSession = URLSession.shared
            urlSession.dataTask(with: url) { (data, response, error) in
                if let data = data, let receivedAlbums = try? JSONDecoder().decode([Album].self, from: data) {
                    DispatchQueue.main.async {
                        self.loading = false
                        self.albums = receivedAlbums
                    }
                }
            }.resume()
        }
    }
}
