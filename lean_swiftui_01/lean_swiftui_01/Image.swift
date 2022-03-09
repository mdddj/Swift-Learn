//
//  Image.swift
//  lean_swiftui_01
//
//  Created by ldd on 2021/12/28.
//

import SwiftUI

struct ImageCommponet: View {
    var body: some View {
        VStack{
            // 使用系统自带图标
            Image(systemName: "plus")
                .foregroundColor(.yellow)
                .font(.system(size: 44))
            
            // 使用本地图片
            Image("wechat")
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .border(Color.orange,width: 10)
                .opacity(0.5)
                .shadow(radius: 10)
                .shadow(color: .purple, radius: 10, x: 20, y: 20)
        }.padding()
    }
}

struct Image_Previews: PreviewProvider {
    static var previews: some View {
        ImageCommponet()
    }
}
