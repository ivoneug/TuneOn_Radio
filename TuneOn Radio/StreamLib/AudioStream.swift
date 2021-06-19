//
//  AudioStream.swift
//  TuneOn Radio
//
//  Created by Evgeniy on 18.06.2021.
//

import Foundation
import AVFoundation

enum AudioStreamState {
    case unknown
    case ready
    case failed
}

class AudioStream: NSObject {
    private(set) var isReady: Bool = false
    private var url: URL
    private var player: AVPlayer
    private var observerContext = 0
    private var onStateChangedCallback: () -> Void
    
    init(stringUrl: String, onStateChanged: @escaping () -> Void) {
        url = URL(string: stringUrl)!
        player = AVPlayer(url: url)
        
        onStateChangedCallback = onStateChanged
        
        super.init()
        
        player.addObserver(self, forKeyPath: "reasonForWaitingToPlay", options: .new, context: &observerContext)
    }
    
    deinit {
        player.removeObserver(self, forKeyPath: "reasonForWaitingToPlay")
    }
    
    public func play() {
        player.play()
    }
    
    public func pause() {
        player.pause()
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        guard context == &observerContext else {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
            return
        }
        
        if keyPath == "reasonForWaitingToPlay" {
            isReady = change![.newKey] is NSNull
            onStateChangedCallback()
        }
    }
}
