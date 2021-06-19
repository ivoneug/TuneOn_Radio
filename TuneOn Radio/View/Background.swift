//
//  Background.swift
//  TuneOn Radio
//
//  Created by Evgeniy on 18.06.2021.
//

import SwiftUI

struct Background: View {
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
    
    init(imageNames: [String]) {
        ambientImages = getAmbienImages(imageNames)
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
        .blur(radius: 15.0)
        .onReceive(switchTimer, perform: { _ in
            withAnimation(.easeOut(duration: 1)) {
                changeImage()
            }
        })
    }
    
    private func changeImage() {
        imageIndex = nextImageIndex
        isFlipped = !isFlipped
    }
    
    private func getAmbienImages(_ imageNames: [String]) -> [UIImage] {
        var images = [UIImage]()
        
        for name in imageNames {
            var image: UIImage?
            let path = Bundle.main.path(forResource: name, ofType: "png")
            
            if let filepath = path {
                image = UIImage(contentsOfFile: filepath)
            }
            
            if let imageItem = image {
                images.append(imageItem)
            }
        }
        
        return images
    }
}

struct Background_Previews: PreviewProvider {
    static var previews: some View {
        Background(imageNames: ["bg1", "bg2", "bg3"])
    }
}
