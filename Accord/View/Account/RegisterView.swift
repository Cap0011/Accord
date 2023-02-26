//
//  RegisterView.swift
//  Accord
//
//  Created by Jiyoung Park on 2023/02/14.
//

import SwiftUI

struct RegisterView: View {
    @State private var nickname = ""
    @State private var email = ""
    @State private var password = ""
    
    @State private var isPasswordOpen = false
    @State private var isCreationSuccess = true
    
    @EnvironmentObject private var authModel: AuthViewModel
    
    var body: some View {
        ZStack(alignment: .top) {
            Color("Blue").ignoresSafeArea()

            VStack(spacing: 0) {
                Text("Register")
                    .foregroundColor(.white)
                    .font(.montserrat(.bold, size: 24))
                    .padding(.top, 10)
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("PICK A NICKNAME")
                        .font(.montserrat(.bold, size: 12))
                        .padding(.top, 20)
                    
                    MyInputForm(input: $nickname, placeholder: "What should everyone call you?")
                        .padding(.top, 10)
                    
                    Text("You can always change this later!")
                        .font(.montserrat(.regular, size: 12))
                        .padding(.top, 10)
                    
                    Text("ACCOUNT INFORMATION")
                        .font(.montserrat(.bold, size: 12))
                        .padding(.top, 20)
                    
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
                    
                    Text("Password must be 6-72 characters")
                        .font(.montserrat(.regular, size: 12))
                        .padding(.top, 10)
                    
                    if nickname.isEmpty {
                        MyButton(backgroundColorName: "BoxGrey", textColorName: "White", text: "Create an account")
                            .padding(.top, 30)
                    } else {
                        // When creating account success
                        MyButton(backgroundColorName: "Yellow", textColorName: "Blue", text: "Create an account")
                            .padding(.top, 30)
                            .onTapGesture {
                                Task {
                                    isCreationSuccess = await authModel.signUp(emailAddress: email, password: password)
                                }
                            }
                            .navigationDestination(isPresented: $isCreationSuccess) {
                                SetProfilePictureView()
                            }
                    }
                        
                    Text("By registering, you agree to Accord’s Terms of Service and Privacy Policy.")
                        .font(.montserrat(.regular, size: 12))
                        .padding(.top, 10)
                }
                .padding(.horizontal, 20)
            }
            .foregroundColor(Color("TextGrey"))
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
