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
                ExampleView()
            }else{
                OtherExampleView()
            }
            
            Button("GET HOMEBOI!", action: {
                self.flag.toggle()
            })
                .buttonStyle(.borderless)
                .background(Color.white)
                .padding()
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
struct OtherExampleView: View {
    var body: some View {
        Text("other text")
    }
}
