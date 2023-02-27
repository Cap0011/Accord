//
//  SetProfilePictureView.swift
//  Accord
//
//  Created by Jiyoung Park on 2023/02/14.
//

import SwiftUI
import Photos
import PhotosUI

struct SetProfilePictureView: View {
    let nickname: String
    let email: String
    let password: String
    
    @State private var selectedItem: PhotosPickerItem?
    @State private var selectedImageData: Data?
    
    @EnvironmentObject private var authModel: AuthViewModel
    
    @State private var isUpdatingSuccess = false
    
    var body: some View {
        ZStack {
            Color("Blue").ignoresSafeArea()
            
            VStack(spacing: 0) {
                Text("Choose profile picture")
                    .foregroundColor(.white)
                    .font(.montserrat(.bold, size: 24))
                    .padding(.top, 10)
                
                Text("Choose a photo that represents you!")
                    .foregroundColor(Color("TextGrey"))
                    .font(.montserrat(.regular, size: 12))
                    .padding(.top, 20)
                Spacer()
                
                PhotosPicker(selection: $selectedItem, matching: .images, photoLibrary: .shared()) {
                    ZStack(alignment: .topTrailing) {
                        if let selectedImageData, let uiImage = UIImage(data: selectedImageData) {
                            Image(uiImage: uiImage)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 180, height: 180)
                                .cornerRadius(90)
                        } else {
                            Circle()
                                .foregroundColor(.white)
                                .opacity(0.2)
                                .frame(width: 180, height: 180)
                        }
                        
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 40))
                            .foregroundColor(Color("Yellow"))
                    }
                }
                
                Spacer()
                
                MyButton(backgroundColorName: "Yellow", textColorName: "Blue", text: "DONE")
                    .onTapGesture {
                        Task {
                            await authModel.signUp(emailAddress: email, password: password)
                            await authModel.updateProfile(nickname: nickname, imageURL: nil)
                        }
                    }
            }
            .padding(.horizontal, 20)
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: MainView()) {
                    Text("Skip")
                }
            }
        }
        .onChange(of: selectedItem) { newItem in
            Task {
                if let data = try? await newItem?.loadTransferable(type: Data.self) {
                    selectedImageData = data
                }
            }
        }
    }
}

struct SetProfilePictureView_Previews: PreviewProvider {
    static var previews: some View {
        SetProfilePictureView(nickname: "HZA", email: "email@email", password: "thisismypassword")
    }
}
