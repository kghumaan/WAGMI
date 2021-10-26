//
//  MapView.swift
//  WAGmi
//
//  Created by KV Ghumaan on 10/23/21.
//

import MapKit
import SwiftUI

struct TravelView: View{
    
    @Binding var mapViewEnabled: Bool
    
    @StateObject private var viewModel = TravelViewModel()
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    var body: some View {
        Button(action: {
            self.mapViewEnabled.toggle()
        }) {
            Text("dismiss")
        }
        Map(coordinateRegion: $region, showsUserLocation: true)
            .scaleEffect(CGSize(width: 1, height: 1))
            .preferredColorScheme(ColorScheme.dark)
            .ignoresSafeArea()
        
    }
}

final class TravelViewModel: ObservableObject {
    var locationManager: CLLocationManager?
    
    func isLocationServicesEnabled(){
        if CLLocationManager.locationServicesEnabled(){
            locationManager = CLLocationManager()
            locationManager?.activityType = .fitness
            locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        }else{
            print("location services disabled")
//            Alert(title: Text("Location Services Disabled"),
//                  message: Text("Please enable to use all of our features"),
//                  primaryButton: Alert.Button.default(Text("Enable"), action: {
//                print("TODO: direct user to enable user services")
//            }),
//                  secondaryButton: Alert.Button.cancel())
        }
    }
}
