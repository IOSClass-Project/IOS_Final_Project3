//
//  MonsterList.swift
//  Hw2
//
//  Created by blaire on 2019/10/16.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import SwiftUI

struct MonsterList: View {
    var body: some View {
        NavigationView{
            List{
                ForEach(monsters) { (monsterClass) in
                    NavigationLink(destination: ContentView(monsterClass: monsterClass)) {
                        MonsterRow(monster: monsterClass)
                    }
                }
            }
            .navigationBarTitle("魔物分類")
        }
    }
}

struct MonsterList_Previews: PreviewProvider {
    static var previews: some View {
        MonsterList()
    }
}
