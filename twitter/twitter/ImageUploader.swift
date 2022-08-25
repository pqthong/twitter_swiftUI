//
//  ImageUploader.swift
//  twitter
//
//  Created by DSOFT on 24/08/2022.
//

import Firebase
import FirebaseStorage
import UIKit

struct ImageUploader {
    static func uploadImage(image: UIImage, completion: @escaping(String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/twitter_profile_image/\(filename)")
        ref.putData(imageData, completion: {_, error in
            if let err = error {
                print("Image Upload fail \(err.localizedDescription)")
            }
            
            ref.downloadURL(completion: { imageUrl, _ in
                guard let imageUrl = imageUrl?.absoluteString else {return}
                completion(imageUrl)
            })
        })
    }
}

