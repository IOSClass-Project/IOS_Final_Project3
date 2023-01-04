//
//  ImagePickerController.swift
//  IOS_FinalProject
//
//  Created by User02 on 2020/1/5.
//  Copyright © 2020 matcha. All rights reserved.
//

import Foundation
import SwiftUI

struct ImagePickerController: UIViewControllerRepresentable {
    
    @Binding var showSelectPhoto: Bool
    @Binding var selectImage: UIImage?
    var index: Int
    
    func makeCoordinator() -> ImagePickerController.Coordinator {
        Coordinator(self, index)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        var imagePickerController: ImagePickerController
        var index: Int
        
        init(_ imagePickerController: ImagePickerController, _ index: Int) {
            self.imagePickerController = imagePickerController
            self.index = index
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            imagePickerController.showSelectPhoto = false
            imagePickerController.selectImage = info[.originalImage] as? UIImage
            picDetect[index] = 1
            //print("number\(number1), number2\(number2)")
        }
        
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePickerController>) -> UIImagePickerController {
        let controller = UIImagePickerController()
        controller.sourceType = .photoLibrary
        controller.delegate = context.coordinator
        return controller
        
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePickerController>) {
    }
}
