//
//  ContentView.swift
//  Shared
//
//  Created by KV Ghumaan on 10/19/21.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State var wagmiAvailable = true  // should be held in memory
    var body: some View {
        
        HStack {
            VStack {
                if !wagmiAvailable {
                    Button("ADOPT NEW HOMEBOI!"){
                        self.wagmiAvailable.toggle()
                    }
                        .foregroundColor(.white)
                        .background(Color.accentColor)
                        .cornerRadius(8)
                }else{
                    DisplayHomeboi()
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

struct DisplayHomeboi: View {
    
    @State var mapViewEnabled = false
    
    var body: some View {
        
        if mapViewEnabled {
            
            MapTravelView()
            
        }else{
            
            
            VStack {
                
                HomeboiGif("384").frame(width: .infinity, height: 260, alignment: .center)  // TODO: height should reflect size of GIF
                
                List {
                    HStack {
                        Text("Health:").frame(width: 90, height: 0.2, alignment: Alignment.leading)
                        ProgressView(value: 0.6)
                    }
                    HStack {
                        Text("Happiness:").frame(width: 90, height: 0.2, alignment: Alignment.leading)
                        ProgressView(value: 0.8)
                    }
                    HStack {
                        Text("Charm:").frame(width: 90, height: 0.2, alignment: Alignment.leading)
                        ProgressView(value: 0.4)
                    }
                    HStack {
                        Text("Rest:").frame(width: 90, height: 0.2, alignment: Alignment.leading)
                        ProgressView(value: 1.0)
                    }
                    HStack {
                        Text("Steps accumulated:")
                        Text("2,324").font(.headline).bold().italic().frame(alignment: Alignment.trailing)
                    }
                    VStack {
                        Text("NEXT LEVEL:").bold().frame(maxWidth: .infinity, alignment: .leading)
                        HStack {
                            ProgressView(value: 0.8).colorMultiply(Color.red)
                            Image(systemName: "star.fill").foregroundColor(Color.yellow)
                        }
                    }
                    
                    Button(action: {
                        self.mapViewEnabled.toggle()
                    }){
                        Text("Map View")
                            .frame(maxWidth: .infinity)
                            .border(Color.blue)
                    }
                }
            }
        }
        
    }
}

struct MapTravelView: View{
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    var body: some View {
        Map(coordinateRegion: $region)
            .scaleEffect(CGSize(width: 1, height: 1)).preferredColorScheme(ColorScheme.dark)
    }
}

struct ProgressBar: ProgressViewStyle {
    let color: Color
    
    func makeBody(configuration: Configuration) -> some View {
        
        // TODO: figure out how to set color...
        ProgressView(configuration).shadow(color: Color(red: 0.3, green: 0.8, blue: 0.6),
                    radius: 4.0, x: 1.0, y: 2.0)
    }
}
