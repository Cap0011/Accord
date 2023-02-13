//
//  FriendsListView.swift
//  Accord
//
//  Created by Jiyoung Park on 2023/02/07.
//

import SwiftUI

struct FriendsListView: View {
    var body: some View {
        NavigationStack {
            ZStack {
//                Color.black.ignoresSafeArea()
                VStack {
                    
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.gray, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Friends")
                        .foregroundColor(.white)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    // TODO: Should be replaced to real destination!
                    NavigationLink(destination: Text("Add friend")) {
                        Image(systemName: "person.fill.badge.plus")
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
}

struct FriendsListView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsListView()
    }
}
