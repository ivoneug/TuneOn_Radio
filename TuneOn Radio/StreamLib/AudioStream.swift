//
//  AudioStream.swift
//  TuneOn Radio
//
//  Created by Evgeniy on 18.06.2021.
//

import Foundation
import AVFoundation

class AudioStream: NSObject {
    private var url: URL
    private var player: AVPlayer
    private var observerContext = 0
    private var onReadyCallback: () -> Void
    private var onFailedCallback: () -> Void
    
    init(stringUrl: String, onReady: @escaping () -> Void, onFailed: @escaping () -> Void) {
        url = URL(string: stringUrl)!
        player = AVPlayer(url: url)
        
        onReadyCallback = onReady
        onFailedCallback = onFailed
        
        super.init()
        
        player.addObserver(self, forKeyPath: "status", options: .new, context: &observerContext)
    }
    
    deinit {
        player.removeObserver(self, forKeyPath: "status")
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
        
        if keyPath == "status" {
            let status = change![.newKey] as! AVPlayer.Status
            switch status {
            case AVPlayer.Status.readyToPlay:
                onReadyCallback()
            case AVPlayer.Status.failed:
                onFailedCallback()
            default:
                break
            }
        }
    }
}
