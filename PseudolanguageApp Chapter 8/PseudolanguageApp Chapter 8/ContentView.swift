//
//  ContentView.swift
//  PseudolanguageApp Chapter 8
//
//  Created by Wallace Wang on 10/24/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
                .background(Color.yellow)
            Text("This is a lot of text to display in a small amount of space to test how well Xcode can truncate large amounts of text.")
                .padding()
                .background(Color.mint)
//                .lineLimit(2)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
