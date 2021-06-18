//
//  Station.swift
//  TuneOn Radio
//
//  Created by Evgeniy on 18.06.2021.
//

import Foundation

var allStations = [
    Station(name: "LoungeFM", url: "https://cast.radiogroup.com.ua/loungefm320.m3u"),
    Station(name: "LoungeFM - Chill Out", url: "https://cast.radiogroup.com.ua/chillout320.m3u"),
    Station(name: "LoungeFM - Acoustic", url: "https://cast.radiogroup.com.ua/acoustic320.m3u"),
    Station(name: "LoungeFM - Terrace", url: "https://cast.radiogroup.com.ua/terrace320.m3u"),
    Station(name: "Avtoradio", url: "https://cast.radiogroup.com.ua/avtoradio320.m3u"),
    Station(name: "Disco Pyatnica", url: "https://cast.radiogroup.com.ua/disko_pt320.m3u"),
    Station(name: "JamFM", url: "https://cast.radiogroup.com.ua/jam_inshyi320.m3u"),
    Station(name: "NRJ", url: "https://cast.radiogroup.com.ua/nrj320.m3u"),
    Station(name: "NRJ All Hits", url: "https://cast.radiogroup.com.ua/nrj_hits320.m3u"),
    Station(name: "NRJ Hot 40", url: "https://cast.radiogroup.com.ua/nrj_hot320.m3u"),
    Station(name: "NRJ Party Hits", url: "https://cast.radiogroup.com.ua/nrj_party320.m3u"),
    Station(name: "Radio Pyatnica", url: "https://cast.radiogroup.com.ua/radiopyatnica320.m3u"),
    Station(name: "RetroFM", url: "https://cast.radiogroup.com.ua/retro320.m3u"),
    Station(name: "Retro Dance", url: "https://cast.radiogroup.com.ua/retro_dance320.m3u"),
    Station(name: "Retro Romantic Ballads", url: "https://cast.radiogroup.com.ua/retro_romantic320.m3u")
]

struct Station {
    var name: String
    var nowPlaying: String = ""
    var url: String
    var imageUrl: String = ""
}
