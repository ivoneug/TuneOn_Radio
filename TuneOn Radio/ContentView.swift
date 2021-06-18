//
//  ContentView.swift
//  TuneOn Radio
//
//  Created by Evgeniy on 18.06.2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private(set) var viewModel: ViewModel
    
    var body: some View {
        VStack {
            Text(viewModel.station.name)
                .padding()
            HStack {
                Button(action: {
                    viewModel.previous()
                }) {
                    Image(systemName: "chevron.backward.circle")
                }
                Button(action: {
                    if viewModel.isPlaying {
                        viewModel.pause()
                    } else {
                        viewModel.play()
                    }
                }) {
                    Image(systemName: viewModel.isPlaying ? "pause.circle" : "play.circle")
                }
                Button(action: {
                    viewModel.next()
                }) {
                    Image(systemName: "chevron.forward.circle")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ViewModel())
    }
}
