//
//  ShowActionSheet.swift
//  lean_swiftui_01
//
//  Created by ldd on 2021/12/25.
//  弹出一个确认的弹窗。

import SwiftUI

struct ShowActionSheet: View {
    
    @State var isPre = false
    
    @State var isAlert = false;
    
    
    /// 底部弹出来的操作。
    var myActionSheet : ActionSheet {
        ActionSheet(title: Text( "确定删除吗？"), message: Text("如果删除了，将无法复原了哦。"), buttons: [
            .default(Text("点错了")){
                print("点错了按钮")
            },
            .destructive(Text("确认删除")){
                print("确认删除")
            }
            ,
            .cancel(Text("取消")){
                print("取消按钮")
            }
            
        ])
    }
    
    
    // 确认按钮
    let primartButton = Alert.Button.default(Text("确认")){
        print("你点击了确认")
    }
    
    // 取消按钮。
    let secondaryButton  = Alert.Button.destructive(Text("取消")){
        print("点击了取消按钮。")
    }
    
    /// 确认弹窗。
    var myAlert: Alert {
        Alert(title: Text("确认删除吗？"), message: Text("此操作将不可逆。"), primaryButton: primartButton, secondaryButton: secondaryButton)
    }
    
    var body: some View {
        VStack{
            Button("显示弹窗"){
                self.isPre = true
            }.actionSheet(isPresented: $isPre, content: {
                myActionSheet
            })
            
            Button("显示确认弹窗"){
                self.isAlert = true
            }.alert(isPresented: $isAlert, content: {
                myAlert
            }).padding()
        }
    }
}

struct ShowActionSheet_Previews: PreviewProvider {
    static var previews: some View {
        ShowActionSheet()
    }
}
