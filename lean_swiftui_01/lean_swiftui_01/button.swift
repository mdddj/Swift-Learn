//
//  button.swift
//  lean_swiftui_01
//
//  Created by ldd on 2021/12/25.
//

import SwiftUI

struct button: View {
    var body: some View {
        VStack {
            
            
//            默认用法
            Button("我是一个按钮") {
                print("我被点击了。")
            }.padding()
            
//            包裹一个组件。
            Button(action:{
               print("我是第二种用法。")
            }) {
                Text("我是按钮的文字")
            }.padding()
            
            
//            加上了图片的按钮
            Button(action: {
                print("我是图片加文字的用发。")
            }) {
                Image(systemName: "clock")
                Text("我是图片按钮")
            }.foregroundColor(.white)
                .background(.green)
            
        }
    }
}

struct button_Previews: PreviewProvider {
    static var previews: some View {
        button()
    }
}
