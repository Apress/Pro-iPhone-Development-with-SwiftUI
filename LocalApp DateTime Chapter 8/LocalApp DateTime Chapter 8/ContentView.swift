//
//  ContentView.swift
//  LocalApp DateTime Chapter 8
//
//  Created by Wallace Wang on 10/24/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var changeColor = false
    @State var name = ""
    @State var buttonNumber = 1
    
    let placeholder: LocalizedStringKey = "placeholder-label"
    let value = 3.1415
    
    let date: Date
    let dateFormatter: DateFormatter
    
    init() {
        date = Date()
        dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .medium
    }
    
    var body: some View {
        VStack {
            Text("greeting-label \(name)")
            Text("pi-label \(value)")
            Button("\(buttonNumber) button-label", action: {
                changeColor.toggle()
                buttonNumber += 1
            })
            TextField(placeholder, text: $name)
            Text(date, formatter: dateFormatter)
        }.background(changeColor ? Color.red : Color.yellow)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .environment(\.locale, .init(identifier: "en"))
            ContentView()
                .environment(\.locale, .init(identifier: "fr"))
            ContentView()
                .environment(\.locale, .init(identifier: "es"))
        }
    }
}
