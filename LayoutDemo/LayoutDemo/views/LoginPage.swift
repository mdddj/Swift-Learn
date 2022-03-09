//
//  LoginPage.swift
//  LayoutDemo
//
//  Created by ldd on 2022/1/10.
//

import SwiftUI

struct LoginPage: View {
    @State var loginNumber: String = ""
    @State var password: String = ""
    var body: some View {
        Form {
            Section(header: Text("用户登录")) {
                TextField("账号", text: $loginNumber)
                SecureField("密码", text: $password)
            }
            Section {
                Button("登录") {
                    print("用户登录...")
                }
            }
        }
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
