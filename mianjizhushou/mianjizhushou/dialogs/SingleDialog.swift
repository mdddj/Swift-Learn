//
//  SingleDialog.swift
//  mianjizhushou
//
//  Created by ldd on 2022/2/15.
//

import SwiftUI


/// 显示一个普通弹窗组件
func SingleDialog(_ title: String,action: @escaping ()->Void) -> Alert {
    Alert(title: Text("\(title)"), dismissButton: Alert.Button.default(Text("确定"),action: action))
}
