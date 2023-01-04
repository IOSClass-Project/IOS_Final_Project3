//
//  MonsterOverview.swift
//  IOS_FinalProject
//
//  Created by User02 on 2020/1/5.
//  Copyright © 2020 matcha. All rights reserved.
//

import SwiftUI

struct MonsterOverview: View {
    var body: some View {
        NavigationView{
            ZStack {
                Color.gray
                ScrollView(.horizontal){
                    HStack(spacing: 20) {
                        ForEach(images) { (imageView) in
                            NavigationLink(destination: GameInfor(game: imageView)) {
                                Image(imageView.name)
                                .renderingMode(.original)
                                .resizable()
                                .scaledToFill()
                                .frame(minWidth: 0, maxWidth: 380, maxHeight: 450)
                                .clipped()
                            }
                        }
                    }
                }
            }
            .edgesIgnoringSafeArea(.all)
            .navigationBarTitle("歷代封面")
        }
    }
}

struct MonsterOverview_Previews: PreviewProvider {
    static var previews: some View {
        MonsterOverview()
    }
}
