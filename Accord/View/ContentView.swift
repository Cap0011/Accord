//
//  ContentView.swift
//  Accord
//
//  Created by Jiyoung Park on 2023/02/06.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Image(systemName: "sun.haze.fill")
                }
            FriendsListView()
                .tabItem {
                    Image(systemName: "person.3")
                }
            ProfileSettingView()
                .tabItem {
                    Image(systemName: "person.circle.fill")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
