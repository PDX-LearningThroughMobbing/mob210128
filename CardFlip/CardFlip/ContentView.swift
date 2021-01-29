//
//  ContentView.swift
//  CardFlip
//
//  Created by Joseph Van Boxtel on 1/28/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CardView(height: 300)
    }
}

struct CardView: View {
    var height : CGFloat
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("9")
                    Spacer()
                }
                Spacer()
            }
            
            Text("9")
                .rotationEffect(Angle.degrees(180.0))
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
        }.font(.largeTitle)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
