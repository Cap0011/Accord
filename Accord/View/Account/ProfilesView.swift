//
//  ProfilesView.swift
//  Accord
//
//  Created by Jiyoung Park on 2023/02/14.
//

import SwiftUI
import Photos
import PhotosUI

struct ProfilesView: View {
    @State private var selectedItem: PhotosPickerItem?
    @State private var selectedImageData: Data?
    
    @State private var nickname: String?
    @State private var number: String?
    
    @EnvironmentObject private var authModel: AuthViewModel
    @StateObject var storageManager = StorageManager()
    
    var body: some View {
        ZStack(alignment: .top) {
            Color("Blue").ignoresSafeArea()
            
            VStack {
                ZStack(alignment: .topTrailing) {
                    if let selectedImageData, let uiImage = UIImage(data: selectedImageData) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 180, height: 180)
                            .cornerRadius(90)
                    } else {
                        if let imageData = storageManager.profileImageData, let uiImage = UIImage(data: imageData) {
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
                    }
                    PhotosPicker(selection: $selectedItem, matching: .images, photoLibrary: .shared()) {
                        Image(systemName: "pencil.circle.fill")
                            .font(.system(size: 40))
                            .foregroundColor(Color("Yellow"))
                    }
                }
                .padding(.top, 60)

                HStack(spacing: 0) {
                    Text(authModel.user?.displayName ?? "VI")
                    Text(" #")
                    Text(String(number ?? "1105"))
                    
                    Image(systemName: "pencil.circle.fill")
                        .padding(.leading, 10)
                }
                .foregroundColor(.white)
                .font(.montserrat(.bold, size: 24))
                .padding(.top, 30)
                .onTapGesture {
                    print(storageManager.profileImageData?.isEmpty)
                }
                
                Spacer()
                
                MyButton(backgroundColorName: "BoxGrey", textColorName: "White", text: "Log Out")
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)
                    .onTapGesture {
                        // Log Out
                        authModel.signOut()
                    }
            }
        }
        .task {
            await authModel.reloadUser()
            storageManager.download(imageURL: authModel.user?.photoURL)
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

struct ProfilesView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilesView()
    }
}
