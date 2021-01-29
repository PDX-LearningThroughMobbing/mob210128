//
//  ContentView.swift
//  CardFlip
//
//  Created by Joseph Van Boxtel on 1/28/21.
//

import SwiftUI

struct ContentView: View {
    @State private var flipped: Double = 0.0
    
    var body: some View {
        Button(action: {
            withAnimation {
                flipped = flipped == 0 ? 1 : 0
            }
        }) {
            Color.clear.modifier(FlipAnimation(animatableData: flipped))
                .transaction { transaction in
                    transaction.animation = transaction.animation?.speed(0.3)
                }
        }.buttonStyle(PlainButtonStyle())
        .highPriorityGesture(DragGesture().onChanged { value in
            withAnimation {
                flipped = Double(value.translation.width) / 200.0
            }
        })
    }
}

struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
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
            
            Diamond().fill()
            
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

struct FlipAnimation : AnimatableModifier {
    var animatableData: Double
    
    func body(content: Content) -> some View {
        Group {
            if animatableData > 0.5 {
                CardBack()
            } else {
                CardFront()
            }
        }
        .padding()
        .rotation3DEffect(Angle.degrees(180 * animatableData), axis: (x: 0, y: 1, z: 0))
    }
}
