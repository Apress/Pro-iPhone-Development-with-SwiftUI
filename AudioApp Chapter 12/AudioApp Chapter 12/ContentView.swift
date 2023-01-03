//
//  ContentView.swift
//  AudioApp Chapter 12
//
//  Created by Wallace Wang on 10/29/21.
//

import SwiftUI

struct ContentView: View {
    @State var playAudio = true
    var body: some View {
        Button(action: {
            if playAudio {
                playSound(sound: "Small World", type: "mp3")
            } else {
                stopSound()
            }
            playAudio.toggle()
        }, label: {
            Text(playAudio ? "Play audio" : "Stop audio")
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
