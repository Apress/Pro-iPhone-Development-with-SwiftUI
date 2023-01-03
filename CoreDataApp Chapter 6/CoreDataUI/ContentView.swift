//
//  ContentView.swift
//  CoreDataUI
//
//  Created by Wallace Wang on 10/9/21.
//

import SwiftUI

struct ContentView: View {
    
    let coreDM: CoreDataManager
    @State var petName = ""
    @State var petBreed = ""
    @State var petArray = [Animal]()
    
    var body: some View {
        VStack {
            TextField("Enter pet name", text: $petName)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Enter pet breed", text: $petBreed)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Save") {
                coreDM.savePet(name: petName, breed: petBreed)
                displayPets()
                petName = ""
                petBreed = ""
            }
            
            List {
                ForEach(petArray, id: \.self) { pet in
                    VStack {
                        Text(pet.name ?? "")
                        Text(pet.breed ?? "")
                    }
                }.onDelete(perform: { indexSet in
                    indexSet.forEach { index in
                        let pet = petArray[index]
                        coreDM.deletePet(animal: pet)
                        displayPets()
                    }
                })
            }
            
            Spacer()
        }.padding()
        .onAppear(perform: {
            displayPets()
        })
    }
    
    func displayPets() {
        petArray = coreDM.getAllPets()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(coreDM: CoreDataManager())
    }
}
