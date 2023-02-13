//
//  FriendRequestView.swift
//  Accord
//
//  Created by Jiyoung Park on 2023/02/14.
//

import SwiftUI

struct FriendRequestView: View {
    @State var requestedUser: String = ""
    
    let nickname: String? = nil
    let number: String? = nil
    
    var body: some View {
        ZStack(alignment: .top) {
            Color("Blue").ignoresSafeArea()

            VStack(spacing: 0) {
                Text("Add your friend on Accord")
                    .foregroundColor(.white)
                    .font(.montserrat(.bold, size: 24))
                    .padding(.top, 20)
                
                Text("You will need both their username and a tag.\nKeep in mind that username is case sensitive.")
                    .font(.montserrat(.medium, size: 12))
                    .padding(.top, 10)
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("ADD VIA USERNAME")
                        .font(.montserrat(.bold, size: 12))
                        .padding(.top, 30)
                    
                    MyInputForm(input: $requestedUser, placeholder: "Username#0000")
                        .padding(.top, 10)
                    
                    Text("You username is \(nickname ?? "VI")#\(number ?? "1105")")
                        .font(.montserrat(.regular, size: 12))
                        .padding(.top, 10)
                    
                    MyButton(backgroundColorName: "Yellow", textColorName: "Blue", text: "Send Friend Request")
                        .padding(.top, 30)
                        .onTapGesture {
                            // TODO: Send friend request
                        }
                }
                .padding(.horizontal, 20)
            }
            .foregroundColor(Color("TextGrey"))
        }
    }
}
struct FriendRequestView_Previews: PreviewProvider {
    static var previews: some View {
        FriendRequestView(requestedUser: "")
    }
}
