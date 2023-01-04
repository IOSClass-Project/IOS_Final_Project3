//
//  GameInfor.swift
//  IOS_FinalProject
//
//  Created by User02 on 2020/1/5.
//  Copyright © 2020 matcha. All rights reserved.
//

import SwiftUI

struct GameInfor: View {
    var game: image
    var body: some View {
        VStack(){
            Group{
                Image(game.name)
                    .resizable()
                    .scaledToFill()
                    .frame(width:300 ,height:350)
                    .clipped()
                Text(game.gameName)
                    .font(Font.system(size: 35))
                Text(game.guide)
                    .font(Font.system(size: 17))
                Button("Show Video"){
                }
            }
        }
    }
}

struct GameInfor_Previews: PreviewProvider {
    static var previews: some View {
        GameInfor(game: images[0])
    }
}
