//
//  SplashScreen.swift
//  TwitterSplashAnimation
//
//  Created by Ali Aghamirbabaei on 1/28/22.
//

import SwiftUI

struct SplashScreen: View {
    
    // Animating property..
    @State var splashAnimation: Bool = false
    
    var body: some View {
        ZStack {
            // Home View.
            // Were going to simply use image for demo
            
            Image("HomeDark")
                .resizable()
                .aspectRatio(contentMode: .fill)
                // Hiding home until splash animation starts...
                .opacity(splashAnimation ? 1 : 0)

            
            Color("BlueColor")
            
            // Masking With Twitter SVG Image
                .mask(
                    // Reverse masking with the help of bending...
                    Rectangle()
                        .overlay(
                            Image("Logo-blue")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, height: 80)
                                .scaleEffect(splashAnimation ? 50 : 1)
                                .blendMode(.destinationOut)
                            )
                )
        }
        .ignoresSafeArea()
        .onAppear {
            // Animating with slight delay of 0.4s...
            // for smooth animation...
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                withAnimation(.easeInOut(duration: 0.4)) {
                    splashAnimation.toggle()
                }
            }
            
        }
    }
}
