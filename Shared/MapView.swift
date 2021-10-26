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
    
    var body: some View {
        Button(action: {
            self.mapViewEnabled.toggle()
        }) {
            Text("dismiss")
        }
        Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
            .scaleEffect(CGSize(width: 1, height: 1))
            .preferredColorScheme(ColorScheme.dark)
            .accentColor(Color.pink)
            .ignoresSafeArea()
            .onAppear{
                viewModel.ensureLocationServicesEnabled()
            }
        
    }
}

final class TravelViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    var locationManager: CLLocationManager?
    
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    func ensureLocationServicesEnabled(){
        if CLLocationManager.locationServicesEnabled(){
            locationManager = CLLocationManager()
            locationManager!.delegate = self
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
    
    private func ensureLocationIsAuthorized(){
        guard let locationManager = locationManager else { return }
        
        switch locationManager.authorizationStatus{
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            // TODO: test this scenario
            _ = Alert(title: Text("Location Restricted"),
                      message: Text("It's likely you have parental controls enabled. Please unrestrict location prior to continuing."))
        case .denied:
            // TODO: test this scenario
            _ = Alert(title: Text("Location Access Needed"),
                      message: Text("You miss out on most of our features without location services enabled. Please toggle in settings."))
        case .authorizedAlways, .authorizedWhenInUse:
            region = MKCoordinateRegion(center: locationManager.location!.coordinate,
                                        span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
        @unknown default:
            break
        }

    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        ensureLocationIsAuthorized()
    }
}
