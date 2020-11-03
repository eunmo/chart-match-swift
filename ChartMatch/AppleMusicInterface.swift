//
//  AppleMusicInterface.swift
//  ChartMatch
//
//  Created by Eunmo Yang on 2020/09/25.
//

import MediaPlayer
import StoreKit

func openMusic() {
    if let url = URL(string: "music://") {
        UIApplication.shared.open(url)
    }
}

func playSongsAuthorized(_ songs: [Song]) {
    let systemMusicPlayer = MPMusicPlayerController.systemMusicPlayer
    let ids = songs.map { $0.id }
    systemMusicPlayer.setQueue(with: ids)
    systemMusicPlayer.play()
    openMusic()
}

func playSongs(_ songs: [Song]) {
    SKCloudServiceController.requestAuthorization {(status : SKCloudServiceAuthorizationStatus) in
        switch status {
        case .authorized:
            playSongsAuthorized(songs)
        case .denied, .restricted: break
        default: break
        }
    }
}

func queueSongsAuthorized(_ songs: [Song]) {
    let systemMusicPlayer = MPMusicPlayerController.systemMusicPlayer
    let ids = songs.map { $0.id }
    let queue = MPMusicPlayerStoreQueueDescriptor(storeIDs: ids)
    systemMusicPlayer.append(queue)
    openMusic()
}

func queueSongs(_ songs: [Song]) {
    SKCloudServiceController.requestAuthorization {(status : SKCloudServiceAuthorizationStatus) in
        switch status {
        case .authorized:
            queueSongsAuthorized(songs)
        case .denied, .restricted: break
        default: break
        }
    }
}
