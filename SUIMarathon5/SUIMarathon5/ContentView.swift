//
//  ContentView.swift
//  SUIMarathon5
//
//  Created by Alina Golubeva on 11/10/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var position = CGPoint(x: 200, y: 200)
    @State private var squareColor: Color = .black

    let colors: [Color] = [.white, .pink, .yellow, .black]
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                ForEach(colors, id: \.self) { color in
                    Rectangle()
                        .fill(color)
                        .frame(height: UIScreen.main.bounds.height / 4)
                }
            }

            customRectangle
                .position(position)
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            position = gesture.location
                        }
                )
        }
    }
    
    var customRectangle: some View {
        let view = Rectangle()
            
        return view
            .frame(width: 100, height: 100)
            .foregroundColor(.white)
                    .blendMode(.difference)
                    .overlay(view.blendMode(.hue))
                    .overlay(view.foregroundColor(.white).blendMode(.overlay))
                    .overlay(view.foregroundColor(.black).blendMode(.overlay))
    }
}

#Preview {
    ContentView()
}
