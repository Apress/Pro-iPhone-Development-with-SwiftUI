//
//  ContentView.swift
//  MapApp Annotation Chapter 11
//
//  Created by Wallace Wang on 10/29/21.
//

import SwiftUI
import MapKit

struct ContentView: View {
    let locationManager = CLLocationManager()

    @State var message = "Map of Paris"
    @State private var region: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 48.856613, longitude: 2.352222), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    
    struct IdentifiablePlace: Identifiable {
        let id: UUID
        let location: CLLocationCoordinate2D
        init(id: UUID = UUID(), lat: Double, long: Double) {
            self.id = id
            self.location = CLLocationCoordinate2D(
                latitude: lat,
                longitude: long)
        }
    }
    
    let place = IdentifiablePlace(lat: 48.856613, long: 2.352222)
    
    var body: some View {
        VStack{
            Map(coordinateRegion: $region,
                annotationItems: [place])
            { place in
                MapAnnotation(coordinate: place.location) {
                    Rectangle().stroke(Color.purple, lineWidth: 5)
                        .frame(width: 70, height: 40)
                }
            }
            TextEditor(text: $message)
                .frame(width: .infinity, height: 100)
        }
        .onAppear {
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.distanceFilter = kCLDistanceFilterNone
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
