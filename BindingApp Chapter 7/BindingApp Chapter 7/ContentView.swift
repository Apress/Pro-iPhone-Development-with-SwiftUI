//
//  ContentView.swift
//  BindingApp Chapter 7
//
//  Created by Wallace Wang on 10/13/21.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    var body: some View {
        VStack {
            Text("Hello, \(message)")
//            HStack {
//                Text("Send a greeting:")
//                TextField("Type a message here", text: $message)
//            }
            DisplayTextField(newVariable: $message)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DisplayTextField: View {
    @Binding var newVariable: String
    var body: some View {
        HStack {
            Text("Send a greeting:")
            TextField("Type a message here", text: $newVariable)
        }
    }
}
