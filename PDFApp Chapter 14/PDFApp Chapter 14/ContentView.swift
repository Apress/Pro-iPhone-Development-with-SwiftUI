//
//  ContentView.swift
//  PDFApp Chapter 14
//
//  Created by Wallace Wang on 11/1/21.
//

import SwiftUI
import PDFKit

struct ViewMe: UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: UIViewRepresentableContext<ViewMe>) -> PDFView {
        let pdfView = PDFView()
        pdfView.document = PDFDocument(url: url)
        return pdfView
    }
    
    func updateUIView(_ uiView: PDFView, context: UIViewRepresentableContext<ViewMe>) {
        
    }
}

struct ContentView: View {

    let fileURL = Bundle.main.url(forResource: "ds11", withExtension: "pdf")
    var body: some View {
        ViewMe(url: fileURL!)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
