//
//  ContentView.swift
//  walkDetector
//
//  Created by Jiwan Kim on 2023/01/18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Shake me!")
            .onShake {
                onMotion()
                print("Device shaken!")
            }
    }
}

//struct ContentView: View {
//    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
//        }
//        .padding()
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
