//
//  MainPage.swift
//  IOS_FinalProject
//
//  Created by User02 on 2020/1/13.
//  Copyright © 2020 matcha. All rights reserved.
//

import SwiftUI

struct MainPage: View {
    @State private var welcome: CGFloat = 1.0
    var body: some View {
        ZStack{
            Color.gray
            VStack{
                Group{
                    Text("歡迎來到")
                        .fontWeight(.bold)
                        .font(.largeTitle)
                        .padding()
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .padding(10)
                        .border(Color.purple, width: 5)
                }
                Image("艾露")
                    .scaleEffect(welcome)
                    .cornerRadius(20)
                    .onTapGesture {
                        if self.welcome <= 1.4 {
                            self.welcome = self.welcome + 0.2
                        }
                        else{
                            self.welcome = 1.0
                        }
                }
                Text("放大圖片")
                .contextMenu{
                    Button(action: {
                        self.welcome = 1.4
                    }) {
                        Text("顯示最大")
                    }
                    Button(action: {
                        self.welcome = 1.0
                    }) {
                        Text("顯示最小")
                    }
                }
                Text("此Ａpp收錄了各種魔物的資料，以及歷代卡普空推出的魔物獵人遊戲版本。")
                    .fontWeight(.bold)
                    .font(.title)
                    .padding()
                    .background(Color.yellow)
                    .foregroundColor(.white)
                    .padding(10)
                    .border(Color.yellow, width: 5)
            }
        }
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}
