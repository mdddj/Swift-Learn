//
//  PageListDemo.swift
//  LayoutDemo
//
//  Created by ldd on 2022/2/8.
//

import SwiftUI

//列表数据展示

struct InfoModel: Hashable {
    var description: String
    var pictureName: String
}


struct PageListDemo: View {
    var msg : [InfoModel]
    var body: some View {
        return NavigationView{
            List{
                ForEach(msg,id: \.self) { message in
                    NavigationLink(destination: {
                        DetailView(imageName: message.pictureName )
                    }){
                        Text(message.description)
                    }
                }
            }.navigationTitle("图片列表")
        }
    }
    
    struct DetailView: View{
        var imageName: String
        var body: some View {
            Image(imageName)
        }
    }
}


