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
            
        VStack {
            
            HomeboiGif("384").frame(width: .infinity, height: 300, alignment: .center)  // TODO: height should reflect size of GIF
            
            List {
                HStack {
                    Image(systemName: "heart.fill")
                    ProgressView(value: 0.6)
                }.padding(10)
                HStack {
                    Image(systemName: "smiley.fill")
                    ProgressView(value: 0.8)
                }.padding(10)
                HStack {
                    Image(systemName: "sparkles")
                    ProgressView(value: 0.4)
                }.padding(10)
                HStack {
                    Image(systemName: "bed.double.fill")
                    ProgressView(value: 1.0)
                }.padding(10)
                HStack {
                    Text("Steps accumulated:")
                    Text("2,324").font(.headline).bold().italic().frame(alignment: Alignment.trailing)
                }.padding(10)
                VStack {
                    Text("NEXT LEVEL:").bold().frame(maxWidth: .infinity, alignment: .leading)
                    HStack {
                        ProgressView(value: 0.6).shadow(color: Color(red: 0.3, green: 0.8, blue: 0.6),
                                    radius: 4.0, x: 1.0, y: 2.0)
                            .foregroundColor(Color.yellow)
                        VStack {
                            Text("Lvl 18")
                            Image(systemName: "star.fill").foregroundColor(Color.black)
                        }.frame(alignment: .top)
                    }
                }.padding(10)
                
                Button(action: {
                    self.mapViewEnabled.toggle()
                }){
                    Image(systemName: "globe")
                        .font(.title).foregroundColor(Color.blue)
                    .frame(minWidth: 0, maxWidth: .infinity)
                }.padding(10)
            }
        }.sheet(isPresented: $mapViewEnabled) {
            TravelView(mapViewEnabled: $mapViewEnabled)
        }
    }
}
