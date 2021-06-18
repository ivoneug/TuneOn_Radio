//
//  Background.swift
//  TuneOn Radio
//
//  Created by Evgeniy on 18.06.2021.
//

import SwiftUI

struct Background: View {
    var station: Station
    private let switchTimer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    private var nextImageIndex: Int {
        var index = imageIndex
        
        index += 1
        if index >= ambientImages.count {
            index = 0
        }
        
        return index
    }
    private var ambientImages: [UIImage] = []
    
    @State var imageIndex: Int = 0
    @State var isFlipped: Bool = false
    
    init(station: Station) {
        self.station = station
        
        ambientImages = station.getAmbienImages()
        imageIndex = 0
        isFlipped = !isFlipped
    }
    
    var body: some View {
        Group {
            if isFlipped {
                Image(uiImage: ambientImages[imageIndex])
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                    .transition(.opacity)
            } else {
                Image(uiImage: ambientImages[imageIndex])
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                    .transition(.opacity)
            }
        }
        .onReceive(switchTimer, perform: { _ in
            withAnimation(.easeOut(duration: 1)) {
                changeImage()
            }
        })
    }
    
    func changeImage() {
        imageIndex = nextImageIndex
        isFlipped = !isFlipped
    }
}

struct Background_Previews: PreviewProvider {
    static var previews: some View {
        Background(station: allStations[0])
    }
}
