//
//  ContentView.swift
//  Text2SpeechApp Chapter 13
//
//  Created by Wallace Wang on 10/30/21.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    
    let audio = AVSpeechSynthesizer()
    @State var convertText = AVSpeechUtterance(string: "")
    @State var textToRead = "This is a test of the emergency broadcast system"
    @State var sliderValue: Float = 0.5
    
    var body: some View {
        VStack (spacing: 25) {
            TextEditor(text: $textToRead)
                .frame(width: 250, height: 200)
            Slider(value: $sliderValue, in: 0...1)
            Button {
                convertText = AVSpeechUtterance(string: textToRead)
                convertText.rate = sliderValue
                audio.speak(convertText)
            } label: {
                Text("Read Text Out Loud")
            }
            
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
