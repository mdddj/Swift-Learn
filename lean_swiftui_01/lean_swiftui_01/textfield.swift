//
//  textfield.swift
//  lean_swiftui_01
//
//  Created by ldd on 2021/12/14.
//

import SwiftUI

struct textfield: View {
    
    
    @State var username: String
    @State var password: String
    
    var body: some View {
        VStack{
            Text("你的用户名是:\(username)")
            Text("你的密码是:\(password)")
            
            TextField("用户名",text: $username,onEditingChanged: {(value)in
                print("用户输入的用户名是：\(self.username)")
            })
            SecureField("密码",text: $password){
                print("用户输入的密码是：\(self.password)")
            }
            
        }.padding()
    }
}

struct textfield_Previews: PreviewProvider {
    static var previews: some View {
        textfield(username: "", password: "")
    }
}
