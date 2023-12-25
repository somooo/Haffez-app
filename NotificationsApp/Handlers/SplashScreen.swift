//
//  SplashScreen.swift
//  NotificationsApp
//
//  Created by jumanah khalid albisher on 07/06/1445 AH.
//
import SwiftUI

struct SplashScreen: View {
    @State private var finshSplash = false
    @State private var showName = true
    @State var scaleAmount: CGFloat = 1
    
    var body: some View {
        ZStack {
            if finshSplash{
                ContentView()
            }else{
                // Background
                    LinearGradient(
                        stops: [
                            Gradient.Stop(color: Color(red: 0.93, green: 0.96, blue: 1), location: 0.00),
                            Gradient.Stop(color: Color(red: 0.93, green: 0.96, blue: 1), location: 0.16),
                            Gradient.Stop(color: Color(red: 0.74, green: 0.89, blue: 0.99), location: 0.34),
                            Gradient.Stop(color: Color(red: 1, green: 1, blue: 1), location: 0.59),
                            ],
                        startPoint: UnitPoint(x: 0.5, y: 0.18),
                        endPoint: UnitPoint(x: 0.5, y: 2.17)
                    )
                    .edgesIgnoringSafeArea(.all)

                VStack{
                    Spacer()
                    Image("logo")
                        .resizable()
                        .aspectRatio( contentMode: .fit)
                        .scaleEffect(scaleAmount)
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    
                    if showName{
                        Text("")
                            .font(.title)
                            .transition(.opacity)
                            .foregroundColor(Color(red: 0.53, green: 0.75, blue: 0.71)
                            )
                        
                        Text("")
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 0.53, green: 0.75, blue: 0.71)
                            )
                    }
                    
                    Spacer()
                    
                    if showName{
                        // Copyright information
                        Text("© 2023 Wild Ones")
                            .font(.footnote)
                            .padding(.bottom, 5)
                    }
                }
                
            }
        }
//        .ignoresSafeArea()
        .onAppear(){
            // Shrink the logo to start the animation
            withAnimation(.easeOut(duration: 1).delay(2)){
                showName.toggle()
                scaleAmount = 0.5
            }
            // Enlarge the logo
            withAnimation(.easeInOut(duration: 1).delay(3)){
                scaleAmount = 60
            }
            // Go to the main page (World page)
            DispatchQueue.main.asyncAfter(deadline: .now()+4){
                finshSplash.toggle()
            }
        }
    }
}

#Preview {
    SplashScreen()
}

