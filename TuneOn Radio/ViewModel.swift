//
//  ViewModel.swift
//  TuneOn Radio
//
//  Created by Evgeniy on 18.06.2021.
//

import Foundation

class ViewModel: ObservableObject {
    @Published private var model: Model
    
    var station: Station {
        model.currentStation
    }
    
    var isPlaying: Bool {
        model.isPlaying
    }
    
    init() {
        model = Model()
    }
    
    func play() {
        model.play()
    }
    
    func pause() {
        model.pause()
    }
    
    func next() {
        model.nextStation()
    }
    
    func previous() {
        model.previousStation()
    }
}
