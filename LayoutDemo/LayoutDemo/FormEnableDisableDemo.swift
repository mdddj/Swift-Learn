//
//  FormEnableDisableDemo.swift
//  LayoutDemo
//
//  Created by ldd on 2022/1/5.
//

import SwiftUI

struct FormEnableDisableDemo: View {
    
    @State var enableForm = false
    @State var enableNotification = false
    @State var userName = ""
    @State var password = ""
    
    var body: some View {
        NavigationView {
            Form {
                Toggle(isOn: $enableForm){
                    Text("禁用表单")
                }
                Section(header: Text("登录"), content: {
                    TextField("账号",text: $userName)
                    SecureField("密码",text: $password)
                    Toggle(isOn: $enableNotification, label: {
                        Text("开启通知")
                    })
                }).disabled(enableForm)
            }
            .navigationTitle(Text("用户登录"))
        }
    }
}

struct FormEnableDisableDemo_Previews: PreviewProvider {
    static var previews: some View {
        FormEnableDisableDemo()
    }
}
