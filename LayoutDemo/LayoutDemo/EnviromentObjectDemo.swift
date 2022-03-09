//
//  EnviromentObjectDemo.swift
//  LayoutDemo
//
//  Created by ldd on 2022/2/1.
//

import SwiftUI

class UserModel : ObservableObject {
    @Published var nickName : String  = "";
}

//全局环境的对象
struct EnviromentObjectDemo: View {
    
    
    @EnvironmentObject var user : UserModel
    
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("请输入你的名字",text: $user.nickName).padding()
                NavigationLink(destination: DetailView(), label: {
                    Text("显示详情")
                })
            }
        }
    }
}

struct EnviromentObjectDemo_Previews: PreviewProvider {
    static var previews: some View {
        
        let user = UserModel()
        user.nickName = "梁典典"
        
       return EnviromentObjectDemo().environmentObject(user)
    }
}
