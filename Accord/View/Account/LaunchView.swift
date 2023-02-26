//
//  LaunchView.swift
//  Accord
//
//  Created by Jiyoung Park on 2023/02/13.
//

import SwiftUI

struct LaunchView: View {
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                Color("Blue").ignoresSafeArea()
                
                VStack(spacing: 0) {
                    HStack {
                        Image(systemName: "airplane.departure")
                            .font(.system(size: 28))
                        Text("Accord")
                            .font(.montserrat(.black, size: 32))
                    }
                    
                    Image("Accord")
                        .resizable()
                        .scaledToFit()
                        .padding(.vertical, -50)
                    
                    Text("Welcome to Accord")
                        .font(.montserrat(.black, size: 24))
                    
                    Text("Join over zero people who use Accord to talk\nwith communities and friends.")
                        .font(.montserrat(.medium, size: 14))
                        .padding(.top, 10)
                        .multilineTextAlignment(.center)
                    
                    NavigationLink(destination: RegisterView()) {
                        MyButton(backgroundColorName: "Yellow", textColorName: "Blue", text: "Register")
                            .padding(.top, 30)
                    }
                    
                    NavigationLink(destination: LogInView()) {
                        MyButton(backgroundColorName: "BoxGrey", textColorName: "White", text: "Log In")
                            .padding(.top, 10)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 50)
                .foregroundColor(.white)
            }
            .navigationTitle("")
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
