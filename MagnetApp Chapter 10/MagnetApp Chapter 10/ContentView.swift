//
//  ContentView.swift
//  MagnetApp Chapter 10
//
//  Created by Wallace Wang on 10/28/21.
//

import SwiftUI
import CoreMotion

struct ContentView: View {
    let motionManager = CMMotionManager()
    let queue = OperationQueue()
    
    @State private var x: Double = 0.0
    @State private var y: Double = 0.0
    @State private var z: Double = 0.0
    
    var body: some View {
        VStack{
            Text("x: \(x)")
            Text("y: \(y)")
            Text("z: \(z)")
        }
        .onAppear {
            motionManager.startMagnetometerUpdates(to: queue) { (data: CMMagnetometerData?, error: Error?) in
                guard let data = data else {
                    print("Error: \(error!)")
                    return
                }
                let trackMotion: CMMagneticField = data.magneticField
                motionManager.magnetometerUpdateInterval = 2.5
                DispatchQueue.main.async {
                    x = trackMotion.x
                    y = trackMotion.y
                    z = trackMotion.z
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
