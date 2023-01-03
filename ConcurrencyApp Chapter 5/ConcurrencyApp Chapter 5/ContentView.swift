//
//  ContentView.swift
//  ConcurrencyApp Chapter 5
//
//  Created by Wallace Wang on 11/5/21.
//

import SwiftUI

struct ContentView: View {
    @State var message = ""
    @State var sliderValue = 0.0

    enum Response {
        case success
    }
    
    var body: some View {
        VStack {
            Button("Click Me") {
                let startTime = NSDate()
//                Thread.sleep(forTimeInterval: 20)
                callFunction()
                let endTime = NSDate()
                message = "Completed in \(endTime.timeIntervalSince(startTime as Date)) seconds."
            }
            Spacer()
            Slider(value: $sliderValue)
            Text("Message = \(message)")
        }
    }
    
    func doSomething() async throws -> Response {
        Thread.sleep(forTimeInterval: 20)
        return Response.success
    }
    
    func callFunction() {
        Task(priority: .high) {
            do {
                _ = try await doSomething()
            } catch {
                //
            }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
