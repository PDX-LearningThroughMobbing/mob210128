//
//  ContentView.swift
//  CardFlip
//
//  Created by Joseph Van Boxtel on 1/28/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CardView()
    }
}

struct CardView: View {
    var body: some View {
        ZStack {
            Text("9")
            Text("9").rotationEffect(Angle.degrees(180.0))
        }.font(.largeTitle)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
