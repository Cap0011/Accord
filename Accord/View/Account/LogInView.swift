//
//  LogInView.swift
//  Accord
//
//  Created by Jiyoung Park on 2023/02/14.
//

import SwiftUI

struct LogInView: View {
    @State private var email = ""
    @State private var password = ""
    
    @State private var isPasswordOpen = false
    @State private var isLogInSuccess = false
    
    @EnvironmentObject private var authModel: AuthViewModel
    
    var body: some View {
        ZStack(alignment: .top) {
            Color("Blue").ignoresSafeArea()

            VStack(spacing: 0) {
                Text("Welcome back!")
                    .foregroundColor(.white)
                    .font(.montserrat(.bold, size: 24))
                    .padding(.top, 10)
                
                Text("We're so excited to see you again!")
                    .font(.montserrat(.medium, size: 12))
                    .padding(.top, 10)
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("ACCOUNT INFORMATION")
                        .font(.montserrat(.bold, size: 12))
                        .padding(.top, 30)
                    
                    MyInputForm(input: $email, placeholder: "Email")
                        .padding(.top, 10)

                    ZStack(alignment: .trailing) {
                        if isPasswordOpen {
                            MyInputForm(input: $password, placeholder: "Password")
                        } else {
                            MySecureInputForm(input: $password, placeholder: "Password")
                        }
                        
                        ZStack {
                            if isPasswordOpen {
                                Image(systemName: "eye.fill")
                                    .padding(.horizontal, 10)
                            } else {
                                Image(systemName: "eye.slash.fill")
                                    .padding(.horizontal, 10)
                            }
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            isPasswordOpen.toggle()
                        }
                    }
                    .padding(.top, 10)
                    
                    Text("Forgot your password?")
                        .font(.montserrat(.regular, size: 12))
                        .padding(.top, 10)
                        .foregroundColor(Color("Lightblue"))
                        .onTapGesture {
                            // TODO: Change password when tapped
                        }
                    
                    MyButton(backgroundColorName: "Yellow", textColorName: "Blue", text: "Log In")
                        .padding(.top, 30)
                        .onTapGesture {
                            // Log In
                            Task {
                                isLogInSuccess = await authModel.signIn(emailAddress: email, password: password)
                            }
                        }
                }
                .padding(.horizontal, 20)
            }
            .foregroundColor(Color("TextGrey"))
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
