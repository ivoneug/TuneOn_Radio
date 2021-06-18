//
//  Model.swift
//  TuneOn Radio
//
//  Created by Evgeniy on 18.06.2021.
//

import Foundation

struct Model {
    var stations: [Station] = allStations
    var currentStation: Station {
        return stations[currentIndex]
    }
    private(set) var isPlaying: Bool = false
    private(set) var isReady: Bool = false
    private var currentIndex = 0
    private var stream: AudioStream?
    
    mutating func nextStation() {
        currentIndex += 1
        if currentIndex == stations.count {
            currentIndex = 0
        }
        
        stationChanged()
    }
    
    mutating func previousStation() {
        currentIndex -= 1
        if currentIndex < 0 {
            currentIndex = stations.count - 1
        }
        
        stationChanged()
    }
    
    mutating func play() {
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
    
    mutating func pause() {
        if !isPlaying {
            return
        }
        isPlaying = false
        
        if let player = stream {
            player.pause()
        }
    }
    
    private mutating func stationChanged() {
        let shouldPlay = isPlaying
        
        if isPlaying {
            clearStream()
        }
        initStream()
        
        if shouldPlay {
            play()
        }
    }
    
    private mutating func initStream() {
        stream = AudioStream(stringUrl: currentStation.url, onReady: {
            
        }, onFailed: {
            
        })
    }
    
    mutating func clearStream() {
        isPlaying = false
        isReady = false
        
        if let player = stream {
            player.pause()
        }
        
        stream = nil
    }
}
