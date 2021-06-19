//
//  Model.swift
//  TuneOn Radio
//
//  Created by Evgeniy on 18.06.2021.
//

import Foundation

class Model {
    var stations: [Station] = allStations
    var currentStation: Station {
        return stations[currentIndex]
    }
    private(set) var isPlaying: Bool = false
    var isReady: Bool {
        stream?.isReady ?? false
    }
    private var currentIndex = 0
    private var stream: AudioStream?
    var onChangeAction: (() -> Void)?
    
    func nextStation() {
        currentIndex += 1
        if currentIndex == stations.count {
            currentIndex = 0
        }
        
        stationChanged()
    }
    
    func previousStation() {
        currentIndex -= 1
        if currentIndex < 0 {
            currentIndex = stations.count - 1
        }
        
        stationChanged()
    }
    
    func play() {
        if isPlaying {
            return
        }
        isPlaying = true
        
        if stream == nil {
            initStream()
        }
        
        if let player = stream {
            player.play()
        }
    }
    
    func pause() {
        if !isPlaying {
            return
        }
        isPlaying = false
        
        if let player = stream {
            player.pause()
        }
    }
    
    private func stationChanged() {
        let shouldPlay = isPlaying
        
        if isPlaying {
            clearStream()
        }
        initStream()
        
        if shouldPlay {
            play()
        }
    }
    
    private func initStream() {
        stream = AudioStream(stringUrl: currentStation.url, onStateChanged: { [self] in
            if let onChange = onChangeAction {
                onChange()
            }
        })
    }
    
    func clearStream() {
        isPlaying = false
        
        if let player = stream {
            player.pause()
        }
        
        stream = nil
    }
}
