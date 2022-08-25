//
//  ProfilePhotoSelectorView.swift
//  twitter
//
//  Created by DSOFT on 24/08/2022.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    
    @State private var showImagePicker = false
    @State private var image: UIImage? = UIImage()
    @State private var profileImage: Image?
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        VStack {
            AuthHeaderView(title1: "Setup your account", title2: "Select a profile photo")
            Button(action: {
                showImagePicker.toggle()
            }, label: {
                if let profileImage = profileImage {
                    profileImage
                        .resizable()
                        .modifier(ProfileImageModifier())
                } else {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .renderingMode(.template)
                        .modifier(ProfileImageModifier())
                }
                
            }).sheet(isPresented: $showImagePicker, onDismiss: {
                loadImage()
            }, content: {
                ImagePicker(selectedImage: $image)
            }).padding(.top, 44)
            
            if let image = image {
                Button (action: {
                    viewModel.uploadProfileImage(image)
                }, label: {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50, alignment: .center)
                        .background(.blue)
                        .clipShape(Capsule())
                        .padding()
                        
                }).shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            }
            Spacer()
           
        }.ignoresSafeArea()
    }
    
    func loadImage() {
        guard let selectedImage = self.image else {return}
        profileImage = Image(uiImage: selectedImage)
    }
    
}

private struct ProfileImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFill()
            .frame(width: 180, height: 180)
            .clipShape(Circle())
            .foregroundColor(.blue)

    }
}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}
