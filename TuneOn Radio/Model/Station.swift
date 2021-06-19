//
//  Station.swift
//  TuneOn Radio
//
//  Created by Evgeniy on 18.06.2021.
//

import SwiftUI

var allStations = [
    Station(id: 0, name: "LoungeFM", url: "https://cast.radiogroup.com.ua/loungefm320.m3u"),
    Station(id: 1, name: "LoungeFM - Chill Out", url: "https://cast.radiogroup.com.ua/chillout320.m3u"),
    Station(id: 2, name: "LoungeFM - Acoustic", url: "https://cast.radiogroup.com.ua/acoustic320.m3u"),
    Station(id: 3, name: "LoungeFM - Terrace", url: "https://cast.radiogroup.com.ua/terrace320.m3u"),
    Station(id: 4, name: "Avtoradio", url: "https://cast.radiogroup.com.ua/avtoradio320.m3u"),
    Station(id: 5, name: "Disco Pyatnica", url: "https://cast.radiogroup.com.ua/disko_pt320.m3u"),
    Station(id: 6, name: "JamFM", url: "https://cast.radiogroup.com.ua/jam_inshyi320.m3u"),
    Station(id: 7, name: "NRJ", url: "https://cast.radiogroup.com.ua/nrj320.m3u"),
    Station(id: 8, name: "NRJ All Hits", url: "https://cast.radiogroup.com.ua/nrj_hits320.m3u"),
    Station(id: 9, name: "NRJ Hot 40", url: "https://cast.radiogroup.com.ua/nrj_hot320.m3u"),
    Station(id: 10, name: "NRJ Party Hits", url: "https://cast.radiogroup.com.ua/nrj_party320.m3u"),
    Station(id: 11, name: "Radio Pyatnica", url: "https://cast.radiogroup.com.ua/radiopyatnica320.m3u"),
    Station(id: 12, name: "RetroFM", url: "https://cast.radiogroup.com.ua/retro320.m3u"),
    Station(id: 13, name: "Retro Dance", url: "https://cast.radiogroup.com.ua/retro_dance320.m3u"),
    Station(id: 14, name: "Retro Romantic Ballads", url: "https://cast.radiogroup.com.ua/retro_romantic320.m3u")
]

struct Station: Identifiable {
    var id: Int
    var name: String
    var nowPlaying: String = ""
    var url: String
    
    func getLogo() -> UIImage {
        let path = Bundle.main.path(forResource: "\(id)_logo", ofType: "png")
        if let filepath = path {
            return UIImage(contentsOfFile: filepath) ?? UIImage.init()
        }
        
        return UIImage.init()
    }
}
