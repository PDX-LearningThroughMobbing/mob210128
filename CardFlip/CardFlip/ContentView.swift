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
            withAnimation {
                flipped.toggle()
            }
        }) {
            
            Group { if flipped {
                CardBack()
            } else {
                CardFront()
                   
                    
            } }
            .rotation3DEffect(flipped ? Angle.degrees(180.0) : Angle.degrees(0.0), axis: (x: 0, y: 1, z: 0))
            .padding()
        }
        
    }
}

struct CardFront: View {
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
        .background(RoundedRectangle(cornerRadius: 8).fill(Color.red))
    }
}

struct CardBack: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 8).fill(Color.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
