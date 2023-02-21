//
//  ContentView.swift
//  Accord
//
//  Created by Jiyoung Park on 2023/02/06.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var authModel: AuthViewModel
    
    var body: some View {
        if let user = authModel.user {
            TabView {
                MainView()
                    .tabItem {
                        Image(systemName: "sun.haze.fill")
                    }
                FriendsListView()
                    .tabItem {
                        Image(systemName: "person.3")
                    }
                SetProfilePictureView()
                    .tabItem {
                        Image(systemName: "person.circle.fill")
                    }
            }
        } else {
            LaunchView()
                .onAppear {
                    authModel.listenToAuthState()
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
