//
//  FormShowHideDemo.swift
//  LayoutDemo
//
//  Created by ldd on 2022/1/5.
//

import SwiftUI

struct FormShowHideDemo: View {
    
    @State var showingVisible = false
    @State var userName = ""
    @State var password = ""
    
    var body: some View {
        NavigationView {
            Form {
                Toggle(isOn: $showingVisible.animation(.spring()), label: {
                    if(showingVisible){
                        Text("隐藏表单")
                    }
                    else{
                        Text("显示表单")
                    }
                })
                
                if(showingVisible)
                {
                    Section(header: Text("登录你的账号"), content: {
                        TextField("账号",text: $userName)
                        SecureField("密码",text: $password)
                    })
                }
            }.navigationTitle(Text("登录"))
        }
    }
}

struct FormShowHideDemo_Previews: PreviewProvider {
    static var previews: some View {
        FormShowHideDemo()
    }
}
