//
//  ContentView.swift
//  Shared
//
//  Created by KV Ghumaan on 10/19/21.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State var noHomeboiAvailable = false  // should be held in memory
    var body: some View {
        VStack {
            if noHomeboiAvailable {
                Button("ADOPT NEW HOMEBOI!", action: {
                    self.noHomeboiAvailable.toggle()
                })
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.accentColor)
                    .cornerRadius(8)
            }else{
                DisplayHomeboi()
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DisplayHomeboi: View {
    var body: some View {
        Text("Gang") // Name of the homeboi
        HomeboiGif("384")  // Name of GIF
        List {
            HStack {
                Text("Health:")
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.red)
                    .scaleEffect(CGSize(width: 1, height: 0.1))
            }
            HStack {
                Text("Happiness:")
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.yellow)
                    .scaleEffect(CGSize(width: 1, height: 0.1))
            }
            HStack {
                Text("Total steps:")
                Text("2,324").font(.headline).bold().italic()
            }
            
            Button(action: {
                print("moving to map view...")
                MapTravelView()
            }){
                Text("Map View")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .border(Color.blue)
                    .padding()
            }
        }
        
    }
}

struct MapTravelView: View{
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    var body: some View {
        Map(coordinateRegion: $region)
            .frame(width: 400, height: 300)
    }
}
