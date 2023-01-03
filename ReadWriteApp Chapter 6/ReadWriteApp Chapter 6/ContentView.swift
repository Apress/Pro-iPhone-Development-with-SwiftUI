//
//  ContentView.swift
//  ReadWriteApp Chapter 6
//
//  Created by Wallace Wang on 10/6/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var createText = ""
    @State var displayText = ""
    
    var body: some View {
        VStack {
            TextEditor(text: $createText)
            HStack {
                Button(action: {
                    let fm = FileManager.default
                    let urls = fm.urls(for: .documentDirectory, in: .userDomainMask)
                    let url = urls.last?.appendingPathComponent("file.txt")
                    do {
                        try createText.write(to: url!, atomically: true, encoding: String.Encoding.utf8)
                    } catch {
                        print("File writing error")
                    }
                    
                }) {
                    Text("Write File")
                }
                Spacer()
                Button(action: {
                    let fm = FileManager.default
                    let urls = fm.urls(for: .documentDirectory, in: .userDomainMask)
                    let url = urls.last?.appendingPathComponent("file.txt")
                    do {
                        let fileContent = try String(contentsOf: url!, encoding: String.Encoding.utf8)
                        displayText = fileContent
                    } catch {
                        print("File reading error")
                    }
                }) {
                    Text("Read File")
                }
            } .padding()
            TextEditor(text: $displayText)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
