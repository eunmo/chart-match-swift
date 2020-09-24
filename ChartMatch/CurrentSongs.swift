//
//  CurrentSongs.swift
//  ChartMatch
//
//  Created by Eunmo Yang on 2020/09/24.
//

import Combine
import SwiftUI

struct Song: Hashable, Codable, Identifiable {
    var id: String
    var rank: Int
    var artist: String
    var name: String
}

final class CurrentSongs: ObservableObject {
    @Published var songs: [Song] = []
    
    func refresh() -> Void {
        print("refreshing!")
        self.songs = []
        let urlAsString = "https://chart.eunmo.be/api/chart/current/single/jp"
        if let url = URL(string: urlAsString) {
            let urlSession = URLSession.shared
            urlSession.dataTask(with: url) { (data, response, error) in
                if let data = data, let receivedSongs = try? JSONDecoder().decode([Song].self, from: data) {
                    DispatchQueue.main.async {
                        print("refreshed!")
                        self.songs = receivedSongs
                    }
                }
            }.resume()
        }
    }
}