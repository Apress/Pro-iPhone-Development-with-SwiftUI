//
//  SwiftUIView.swift
//  StoryboardApp Chapter 14
//
//  Created by Wallace Wang on 11/2/21.
//

import SwiftUI

struct SwiftUIView: View {
    
    var name: String
    
    var body: some View {
        Text("Hello, \(name)")
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView(name: "Hanna")
    }
}
