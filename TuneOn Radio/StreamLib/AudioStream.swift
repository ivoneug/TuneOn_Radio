//
//  AudioStream.swift
//  TuneOn Radio
//
//  Created by Evgeniy on 18.06.2021.
//

import Foundation
import AVFoundation

class AudioStream {
    private var url: URL
    private var player: AVPlayer
    
    init(stringUrl: String) {
        url = URL(string: stringUrl)!
        player = AVPlayer(url: url)
    }
    
    public func play() {
        player.play()
    }
    
    public func pause() {
        player.pause()
    }
}
