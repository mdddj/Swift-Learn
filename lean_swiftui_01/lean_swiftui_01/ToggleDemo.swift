//
//  ToggleDemo.swift
//  lean_swiftui_01
//
//  Created by ldd on 2022/1/1.
// 开关控件

import SwiftUI

struct ToggleDemo: View {
    
    @State private var value = true
    var body: some View {
        VStack {
            
            Text("你的选择是：\(self.value.description)").padding().foregroundColor(.green)
            
            Toggle(isOn: $value){
                Text("接收消息通知")
            }.padding()
        }
    }
}

struct ToggleDemo_Previews: PreviewProvider {
    static var previews: some View {
        ToggleDemo()
    }
}
