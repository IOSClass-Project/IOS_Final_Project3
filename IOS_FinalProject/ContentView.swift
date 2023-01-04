//
//  ContentView.swift
//  IOS_FinalProject
//
//  Created by User02 on 2020/1/4.
//  Copyright © 2020 matcha. All rights reserved.
//

import SwiftUI
import Combine
import FirebaseFirestore

struct monster: Identifiable{
    var id = ""
    var name = ""
    var data = ""
}

struct MonsterData: Identifiable {
    var id = UUID()
    var name: String
    //var monster: [monster]
}

class getData: ObservableObject{
    @Published var 牙龍種 = [monster](){
        didSet{
        }
    }
    @Published var 古龍種 = [monster](){
        didSet{
        }
    }
    @Published var 海龍種 = [monster](){
        didSet{
        }
    }
    @Published var 飛龍種 = [monster](){
        didSet{
        }
    }
    @Published var 獸龍種 = [monster](){
        didSet{
        }
    }
    @Published var 牙獸種 = [monster](){
        didSet{
        }
    }
    
    init(){
        let db = Firestore.firestore()
        db.collection("牙龍種").addSnapshotListener { (snap, err) in
            if err != nil{
                print((err?.localizedDescription)!)
                return
            }
            
            for i in (snap?.documentChanges)! {
                let name = i.document.data()["name"] as! String
                let data = i.document.data()["data"] as! String
                let id = i.document.documentID
                
                DispatchQueue.main.async {
                    self.牙龍種.append(monster(id: id, name: name, data: data))
                }
            }
        }
        let db2 = Firestore.firestore()
        db2.collection("牙獸種").addSnapshotListener { (snap, err) in
            if err != nil{
                print((err?.localizedDescription)!)
                return
            }
            
            for i in (snap?.documentChanges)! {
                let name = i.document.data()["name"] as! String
                let data = i.document.data()["data"] as! String
                let id = i.document.documentID
                
                DispatchQueue.main.async {
                    self.牙獸種.append(monster(id: id, name: name, data: data))
                }
            }
        }
        let db3 = Firestore.firestore()
        db3.collection("海龍種").addSnapshotListener { (snap, err) in
            if err != nil{
                print((err?.localizedDescription)!)
                return
            }
            
            for i in (snap?.documentChanges)! {
                let name = i.document.data()["name"] as! String
                let data = i.document.data()["data"] as! String
                let id = i.document.documentID
                
                DispatchQueue.main.async {
                    self.海龍種.append(monster(id: id, name: name, data: data))
                }
            }
        }
        let db4 = Firestore.firestore()
        db4.collection("古龍種").addSnapshotListener { (snap, err) in
            if err != nil{
                print((err?.localizedDescription)!)
                return
            }
            
            for i in (snap?.documentChanges)! {
                let name = i.document.data()["name"] as! String
                let data = i.document.data()["data"] as! String
                let id = i.document.documentID
                
                DispatchQueue.main.async {
                    self.古龍種.append(monster(id: id, name: name, data: data))
                }
            }
        }
        let db5 = Firestore.firestore()
        db5.collection("飛龍種").addSnapshotListener { (snap, err) in
            if err != nil{
                print((err?.localizedDescription)!)
                return
            }
            
            for i in (snap?.documentChanges)! {
                let name = i.document.data()["name"] as! String
                let data = i.document.data()["data"] as! String
                let id = i.document.documentID
                
                DispatchQueue.main.async {
                    self.飛龍種.append(monster(id: id, name: name, data: data))
                }
            }
        }
        let db6 = Firestore.firestore()
        db6.collection("獸龍種").addSnapshotListener { (snap, err) in
            if err != nil{
                print((err?.localizedDescription)!)
                return
            }
            
            for i in (snap?.documentChanges)! {
                let name = i.document.data()["name"] as! String
                let data = i.document.data()["data"] as! String
                let id = i.document.documentID
                
                DispatchQueue.main.async {
                    self.獸龍種.append(monster(id: id, name: name, data: data))
                }
            }
        }
    }
}

struct ContentView: View {
    @ObservedObject var data1 = getData()
    var monsterClass: MonsterData
    var body: some View {
        var data = data1.牙龍種
        if monsterClass.name == "牙獸種" {
            data = data1.牙獸種
        }
        else if monsterClass.name == "海龍種" {
            data = data1.海龍種
        }
        else if monsterClass.name == "古龍種" {
            data = data1.古龍種
        }
        else if monsterClass.name == "飛龍種" {
            data = data1.飛龍種
        }
        else if monsterClass.name == "獸龍種" {
            data = data1.獸龍種
        }
        return List(data){ i in
            cellView(name: i.name, data: i.data)
        }
    }
}

struct cellView: View {
    @State var name = ""
    @State var data = ""
    
    var body: some View{
        VStack(){
            Group{
                Image(name)
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 300)
                    .background(Color.white)
                    .cornerRadius(40)
                    .clipped()
                    .padding()
                Text(data)
                    .font(Font.system(size: 20))
                Spacer()
            }
        }
        .background(Color.gray)
        .cornerRadius(40)
        .shadow(radius: 20)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(monsterClass: monsters[0])
    }
}
