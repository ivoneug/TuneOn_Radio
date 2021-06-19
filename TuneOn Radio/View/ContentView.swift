//
//  ContentView.swift
//  TuneOn Radio
//
//  Created by Evgeniy on 18.06.2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private(set) var viewModel: ViewModel
    
    @State var isSwitched: Bool = false
    @State var isNext: Bool = false
    
    var body: some View {
        ZStack {
            Background(imageNames: ["bg1", "bg2", "bg3"])
                .zIndex(-1)
            VStack {
                if isSwitched {
                    StationHeader(station: viewModel.station)
                        .transition(AnyTransition.asymmetric(insertion: .move(edge: isNext ? .trailing : .leading), removal: .move(edge: isNext ? .leading : .trailing)))
                } else {
                    StationHeader(station: viewModel.station)
                        .transition(AnyTransition.asymmetric(insertion: .move(edge: isNext ? .trailing : .leading), removal: .move(edge: isNext ? .leading : .trailing)))
                }
                ControlPanel(previousAction: {
                    withAnimation(.easeInOut) {
                        viewModel.previous()
                        isSwitched = !isSwitched
                        isNext = false
                    }
                }, nextAction: {
                    withAnimation(.easeInOut) {
                        viewModel.next()
                        isSwitched = !isSwitched
                        isNext = true
                    }
                }, playPauseToggleAction: {
                    if viewModel.isPlaying {
                        viewModel.pause()
                    } else {
                        viewModel.play()
                    }
                }, isPlaying: viewModel.isPlaying, isReady: viewModel.isReady)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ViewModel())
    }
}
