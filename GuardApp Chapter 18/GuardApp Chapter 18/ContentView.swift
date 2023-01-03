//
//  ContentView.swift
//  GuardApp Chapter 18
//
//  Created by Wallace Wang on 11/7/21.
//

import SwiftUI

struct ContentView: View {
    @State var showImage: UIImage = UIImage(systemName: "photo")!
    var body: some View {
        VStack {
            Image(uiImage: showImage)
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 400)
            Button {
                getImage(imageName: "car")
//                getImage(imageName: "xyz")
            } label: {
                Text("Add Picture")
            }
        }
    }
    
    func getImage(imageName: String) {
        guard UIImage(named: imageName) != nil else {
            showImage = UIImage(systemName: "xmark.octagon.fill")!
            return
        }
        showImage = UIImage(named: imageName)!
        
//        if UIImage(named: "xyz") != nil {
//            showImage = UIImage(named: "care")!
//        } else {
//            showImage = UIImage(systemName: "xmark.octagon.fill")!
//        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

