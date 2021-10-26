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
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    var body: some View {
        Button(action: {
            self.mapViewEnabled.toggle()
        }) {
            Text("dismiss")
        }
        Map(coordinateRegion: $region)
            .scaleEffect(CGSize(width: 1, height: 1))
            .preferredColorScheme(ColorScheme.dark)
            .ignoresSafeArea()
        
    }
}
