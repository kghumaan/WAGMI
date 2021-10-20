//
//  ContentView.swift
//  Shared
//
//  Created by KV Ghumaan on 10/19/21.
//

import SwiftUI

struct ContentView: View {
    @State var flag = true
    var body: some View {
        VStack {
            if flag {
                Button("ADOPT NEW HOMEBOI!", action: {
                    self.flag.toggle()
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

func acquireHomeboi(){
    print("test")
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ExampleView: View {
    var body: some View {
        Text("some text")
    }
}
struct DisplayHomeboi: View {
    var body: some View {
        Text("Gang")  // Name of the homeboi
        HomeboiGif("384")  // Name of GIF
    }
}
