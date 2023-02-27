//
//  StorageManager.swift
//  Accord
//
//  Created by Jiyoung Park on 2023/02/28.
//

import SwiftUI
import FirebaseStorage

class StorageManager: ObservableObject {
    // Get a reference to the storage service using the default Firebase App
    let storage = Storage.storage()
    
    @Published var profileImageData: Data?
    
    func upload(data: Data?) async -> URL? {
        guard let data = data else {
            return nil
        }
        do {
            // Create a storage reference from our storage service
            let storageRef = storage.reference().child("profilePhotos/\(UUID().uuidString)")
            
            // Upload the file to the path
            try await storageRef.putDataAsync(data)
            
            // Access to download URL after upload
            return try await storageRef.downloadURL()
        } catch {
            print("An error occured: \(error.localizedDescription)")
            return nil
        }
    }
    
    func download(imageURL: URL?) {
        guard let imageURL = imageURL else {
            return
        }
        // Create a reference from a Google Cloud Storage URI
        let storageRef = storage.reference(forURL: imageURL.absoluteString)
        
        // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
        storageRef.getData(maxSize: 1 * 1024 * 1024) { data, error in
            if let error = error {
                print("An error occured: \(error.localizedDescription)")
                return
            } else {
                // Data for the path is returned
                self.profileImageData = data ?? nil
            }
        }
    }
}
