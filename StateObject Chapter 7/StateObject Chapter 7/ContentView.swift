//
//  ContentView.swift
//  StateObject Chapter 7
//
//  Created by Wallace Wang on 10/15/21.
//

import SwiftUI

struct ContentView: View {

    @StateObject var cat = AnimalModel()

    var body: some View {
        VStack {
            Text("Hello, \(cat.name)")
            Text("Breed: \(cat.breed)")
            Text("Age: \(Int(cat.age))")
            Text("Weight: \(cat.weight)")
            DisplayTextField(creature: cat)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DisplayTextField: View {

    @ObservedObject var creature: AnimalModel

    var body: some View {
        VStack {
            HStack {
                Text("Name:")
                TextField("Type a name here", text: $creature.name)
            }
            
            HStack {
                Text("Breed:")
                TextField("Type a breed here", text: $creature.breed)
            }
            
            HStack {
                Text("Age:")
                Slider(value: $creature.age, in: 0...20)
            }
            
            HStack {
                Text("Weight:")
                Slider(value: $creature.weight, in: 0...200)
            }
        }
    }
}

class AnimalModel: ObservableObject {
    @Published var name: String = ""
    @Published var breed: String = ""
    @Published var age: Double = 0.0
    @Published var weight: Double = 0.0
}

