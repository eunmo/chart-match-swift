//
//  AppleMusicInterface.swift
//  ChartMatch
//
//  Created by Eunmo Yang on 2020/09/25.
//

import MediaPlayer
import StoreKit

func playSongAuthorized(_ songs: [Song]) {
    let systemMusicPlayer = MPMusicPlayerController.systemMusicPlayer
    let ids = songs.map { $0.id }
    systemMusicPlayer.setQueue(with: ids)
    systemMusicPlayer.play()
}

func playSongs(_ songs: [Song]) {
    SKCloudServiceController.requestAuthorization {(status : SKCloudServiceAuthorizationStatus) in
        switch status {
        case .authorized:
            playSongAuthorized(songs)
        case .denied, .restricted: break
        default: break
        }
    }
}
