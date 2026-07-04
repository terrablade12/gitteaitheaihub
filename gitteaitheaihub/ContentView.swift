//
//  ContentView.swift
//  gitteaitheaihub
//
//  Created by Iain Tan Qi yuan on 4/7/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack{
            
            LinearGradient(colors: [.green, .blue],
                                            startPoint: .topTrailing,
                                            endPoint: .bottomTrailing)
            VStack {

                Text("IAIN")
                    .bold()
                    .font(.largeTitle)
                    .foregroundStyle(LinearGradient(colors: [.white, .yellow],
                                                    startPoint: .topTrailing,
                                                    endPoint: .bottomTrailing))
            }
            
        }
        .ignoresSafeArea()
        

        
    }
}

#Preview {
    ContentView()
}
