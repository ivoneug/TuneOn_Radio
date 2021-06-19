//
//  StationHeader.swift
//  TuneOn Radio
//
//  Created by Evgeniy on 18.06.2021.
//

import SwiftUI

struct StationHeader: View {
    var station: Station
    
    var body: some View {
        VStack {
            Image(uiImage: station.getLogo())
            Text(station.name)
                .font(.title2)
                .padding()
                .background(Color.white.opacity(0.75))
                .cornerRadius(5, corners: [.allCorners])
                .shadow(radius: 7)
        }
        .padding(44)
    }
}

struct StationHeader_Previews: PreviewProvider {
    static var previews: some View {
        StationHeader(station: allStations[0])
    }
}
