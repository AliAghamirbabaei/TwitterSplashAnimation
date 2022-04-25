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
            Image("HomeDark")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .opacity(splashAnimation ? 1 : 0)
            
            
            Color("BlueColor")
                .mask(
                    Rectangle()
                        .overlay(
                            HStack {
                                Image("Elon")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 300)
                                    .scaleEffect(splashAnimation ? 50 : 1)
                                    .blendMode(.destinationOut)
                            }
                        )
                )
        }
        .ignoresSafeArea()
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                withAnimation(.easeInOut(duration: 3)) {
                    splashAnimation.toggle()
                }
            }
            
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
