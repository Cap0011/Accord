//
//  AuthViewModel.swift
//  Accord
//
//  Created by Jiyoung Park on 2023/02/22.
//

import SwiftUI
import FirebaseAuth

final class AuthViewModel: ObservableObject {
    var user: User? {
        didSet {
            objectWillChange.send()
        }
    }
    
    func listenToAuthState() {
        Auth.auth().addStateDidChangeListener { [weak self] _, user in
            guard let self = self else {
                return
            }
            self.user = user
        }
    }
    
    func signUp(
        emailAddress: String,
        password: String
    ) async -> Bool {
        do {
            try await Auth.auth().createUser(withEmail: emailAddress, password: password)
            return true
        } catch {
            print("An error occured: \(error.localizedDescription)")
            return false
        }
//        Auth.auth().createUser(withEmail: emailAddress, password: password) { result, error in
//            if let error = error {
//                print("An error occured: \(error.localizedDescription)")
//                isSuccess = false
//                return
//            }
//        }
    }
    
    func signIn(
        emailAddress: String,
        password: String
    ) async -> Bool {
        do {
            try await Auth.auth().signIn(withEmail: emailAddress, password: password)
            return true
        } catch {
            print("An error occured: \(error.localizedDescription)")
            return false
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
}
