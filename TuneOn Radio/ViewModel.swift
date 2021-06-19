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
    
    var isReady: Bool {
        model.isReady
    }
    
    init() {
        model = Model()
    }
    
    func play() {
        prepare()
        model.play()
    }
    
    func pause() {
        prepare()
        model.pause()
    }
    
    func next() {
        prepare()
        model.nextStation()
    }
    
    func previous() {
        prepare()
        model.previousStation()
    }
    
    private func prepare() {
        model.onChangeAction = notifyChange
        notifyChange()
    }
    
    private func notifyChange() {
        self.objectWillChange.send()
    }
}
