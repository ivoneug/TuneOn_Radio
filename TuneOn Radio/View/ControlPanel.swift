//
//  ControlPanel.swift
//  TuneOn Radio
//
//  Created by Evgeniy on 18.06.2021.
//

import SwiftUI

struct ControlPanel: View {
    var previousAction: () -> Void
    var nextAction: () -> Void
    var playPauseToggleAction: () -> Void
    var isPlaying: Bool = false
    
    var body: some View {
        HStack {
            Button(action: previousAction) {
                Image(systemName: "chevron.backward.circle")
            }
            Button(action: playPauseToggleAction) {
                Image(systemName: isPlaying ? "pause.circle" : "play.circle")
            }
            Button(action: nextAction) {
                Image(systemName: "chevron.forward.circle")
            }
        }
        .font(Font.system(size: 44))
        .padding()
        .foregroundColor(.black)
        .background(Color.white.opacity(0.75))
        .cornerRadius(10, corners: [.allCorners])
    }
}

struct ControlPanel_Previews: PreviewProvider {
    static var previews: some View {
        ControlPanel(previousAction: {
            
        }, nextAction: {
            
        }, playPauseToggleAction: {
            
        }, isPlaying: false)
    }
}
