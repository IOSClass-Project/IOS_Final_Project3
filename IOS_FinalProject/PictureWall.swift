//
//  PictureWall.swift
//  IOS_FinalProject
//
//  Created by User02 on 2020/1/5.
//  Copyright © 2020 matcha. All rights reserved.
//

import SwiftUI

struct PictureWall: View {
    @State private var showSelectPhoto: Bool = false
    @State private var selectImage: UIImage?
    
    var body: some View {
        func countNumber(count: Int) -> Int{
            return count/2
        }
        /*func calcu(number1: Int, number2: Int) -> Bool{
            2*number1+1+number2 == 1
        }*/
        
        let picCount = pictures.count
        return List(0 ..< countNumber(count: picCount)) { index in
            ForEach(0 ..< 2) { (index2) in
                ImagePic(picName: "pic\(2*index+1+index2)", showSelectPhoto: self.$showSelectPhoto, selectImage: self.$selectImage, index: (2*index+index2)%picDetect.count)
            }
            .frame(height: 250)
        }
    }
}

struct ImagePic: View {
    var picName: String
    @Binding var showSelectPhoto: Bool
    @Binding var selectImage: UIImage?
    var index: Int
    
    var body: some View {
        Button(action: {
            self.showSelectPhoto = true
        }){
            Group{
                if selectImage != nil && picDetect[index] == 1 {
                    Image(uiImage: selectImage!)
                    .resizable()
                    .renderingMode(.original)
                } else{
                    Image(picName)
                    .resizable()
                    //Text("\(index)")
                }
            }
            .scaledToFill()
            .frame(width: 200)
            .clipped()
        }
        .buttonStyle(PlainButtonStyle())
        .sheet(isPresented: $showSelectPhoto) {
            ImagePickerController(showSelectPhoto: self.$showSelectPhoto, selectImage: self.$selectImage, index: self.index)
        }
    }
}

struct PictureWall_Previews: PreviewProvider {
    static var previews: some View {
        PictureWall()
    }
}
