//
//  ContentView.swift
//  Speech2TextApp
//
//  Created by Wallace Wang on 10/30/21.
//

import SwiftUI
import Speech

struct ContentView: View {
    
    let audioEngine = AVAudioEngine()
    let speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "en-US"))
    @State var request = SFSpeechAudioBufferRecognitionRequest()
    @State var recognitionTask : SFSpeechRecognitionTask?
    @State var message = ""
    
    var body: some View {
        VStack (spacing: 25) {
            Button {
                recognizeSpeech()
            } label: {
                Text("Start recording")
            }
            
            TextField("Spoken text appears here", text: $message)
            
            Button {
                message = ""
                stopSpeech()
            } label: {
                Text("Stop recording")
            }
        }
    }
    
    func stopSpeech() {
        audioEngine.stop()
        request.endAudio()
        recognitionTask?.cancel()
        audioEngine.inputNode.removeTap(onBus: 0)
    }
    
    func recognizeSpeech() {
        let node = audioEngine.inputNode
        
        request = SFSpeechAudioBufferRecognitionRequest()
        request.shouldReportPartialResults = true
        
        let recordingFormat = node.outputFormat(forBus: 0)
        node.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer, _) in
            self.request.append(buffer)
        }
        
        audioEngine.prepare()
        do {
            try audioEngine.start()
        } catch {
            return print (error)
        }
        
        guard let recognizeMe = SFSpeechRecognizer() else {
            return
        }
        
        if !recognizeMe.isAvailable {
            return
        }
        
        recognitionTask = speechRecognizer?.recognitionTask(with: request, resultHandler: {result, error in
            if let result = result {
                let transcribedString = result.bestTranscription.formattedString
                message = transcribedString
            } else if let error = error {
                print(error)
            }
        })
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
