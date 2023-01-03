//
//  ContentView.swift
//  BindingFileApp Chapter 7
//
//  Created by Wallace Wang on 10/13/21.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    var body: some View {
        VStack {
            Text("Hello, \(message)")

            SwiftUIView(newVariable: $message)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

