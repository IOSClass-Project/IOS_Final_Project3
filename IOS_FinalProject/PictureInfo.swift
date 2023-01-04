//
//  PictureInfo.swift
//  IOS_FinalProject
//
//  Created by User02 on 2020/1/5.
//  Copyright © 2020 matcha. All rights reserved.
//

import SwiftUI

struct PictureInfo: View {
    var picName: String
    var body: some View {
        VStack(){
            Group{
                Image(picName)
                    .resizable()
                    .scaledToFill()
                    .frame(width:300 ,height:350)
                    .clipped()
            }
        }
    }
}

struct PictureInfo_Previews: PreviewProvider {
    static var previews: some View {
        PictureInfo(picName: "pic1")
    }
}
