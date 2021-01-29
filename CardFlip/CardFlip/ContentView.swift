//
//  ContentView.swift
//  CardFlip
//
//  Created by Joseph Van Boxtel on 1/28/21.
//

import SwiftUI

struct ContentView: View {
    @State private var flipped = false

    var body: some View {
        Button(action: {
            flipped.toggle()
        }) {
            CardView()
                .padding()
                .rotationEffect(flipped ? Angle.degrees(180.0) : Angle.degrees(90.0))
        }

    }
}

struct CardView: View {
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("9").padding()
                    Spacer()
                }
                Spacer()
            }
            
            Text("9")
                .rotationEffect(Angle.degrees(180.0))
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
        }.font(.largeTitle)
        .background(RoundedRectangle(cornerRadius: 8).stroke(Color.primary))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
