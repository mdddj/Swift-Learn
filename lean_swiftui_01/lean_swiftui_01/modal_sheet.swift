//
//  modal_sheet.swift
//  lean_swiftui_01
//
//  Created by ldd on 2021/12/25.
//


// 点击一个按钮，弹出一个模态框。

import SwiftUI

struct modal_sheet: View {
    
    
    @State var isPresented =  false
    
    var body: some View {
            
        
        VStack {
            
            Button("打开模态框"){
                self.isPresented = true
            }.sheet(isPresented: $isPresented, onDismiss: {
                print("我被销毁了。")
            }, content: {
                DetailVew(message: "我是弹出来的标题奥。")
            })
            
        }

    }
}


struct DetailVew: View {
    
    let message: String
    
    
    var body: some View {
        Text(message)
            .font(.largeTitle)
    }
}

struct modal_sheet_Previews: PreviewProvider {
    static var previews: some View {
        modal_sheet()
    }
}
