//
//  ContentView.swift
//  gitteaitheaihub
//
//  Created by Iain Tan Qi yuan on 4/7/26.
//

import SwiftUI

struct ContentView: View {
    @State private var isAnimating = false
    @State private var offset = CGSize.zero
    @State private var isAnimating2 = false
    @State private var offset2 = CGSize.zero
    @State private var rotationAngle = 0.0
    @State private var spring = 0.0
    @State private var scale = 1.0
    
    var body: some View {
        
        
        ZStack{
            
            LinearGradient(colors: [.green, .blue],
                           startPoint: .topTrailing,
                           endPoint: .bottomTrailing)
            VStack {
                
                Text("DRAG THE CIRCLE")
                    .bold()
                    .font(.largeTitle)
                    .foregroundStyle(isAnimating2 ? LinearGradient(colors: [.white, .yellow],
                                                       startPoint: .topTrailing,
                                                       endPoint: .bottomTrailing) : LinearGradient(colors: [.blue, .black],
                                                                                                   startPoint: .topTrailing,
                                                                                                   endPoint: .bottomTrailing))
                

                    .offset(offset2)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                self.offset2 = value.translation
                                isAnimating2 = true
                            }
                            .onEnded { _ in
                                withAnimation {
                                    self.offset2 = .zero
                                    isAnimating2 = false
                                }
                            }
                    )
                Circle()
                
                    .fill(isAnimating ? LinearGradient(colors: [.yellow, .white],
                                                       startPoint: .topTrailing,
                                                       endPoint: .bottomTrailing) : LinearGradient(colors: [.blue, .black],
                                                                                                   startPoint: .topTrailing,
                                                                                                   endPoint: .bottomTrailing))
                
                    .frame(width: 100, height: 100)
                    .rotationEffect(.degrees(rotationAngle))
                    .scaleEffect(CGSize(width: scale, height: scale), anchor: .leading)
                    .offset(offset)
//                    .animation(.bouncy)
                    .animation(.interpolatingSpring(mass: 1, stiffness: 100, damping: 5, initialVelocity: 3), value: spring)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                withAnimation {
                                    self.offset = value.translation
                                    isAnimating = true
                                    rotationAngle = 180
                                    scale = 1.5
                                    spring = 1
                                }
                            }
                            .onEnded { _ in
                                withAnimation {
                                    self.offset = .zero
                                    isAnimating = false
                                    rotationAngle = 0.0
                                    scale = 1
                                    spring = 0
                                }
                            }
                    )

                    
                
                
            }
            
        }
        .ignoresSafeArea()
        
        
        
    }
}

#Preview {
    ContentView()
}
