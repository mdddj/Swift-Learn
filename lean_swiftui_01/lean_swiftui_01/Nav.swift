//
//  Nav.swift
//  lean_swiftui_01
//
//  Created by ldd on 2021/12/25.
//


// 路由的学习。

import SwiftUI



// 用户模型。
class UserModel:ObservableObject {
    @Published var nickName: String = ""
}

// 详情页面
struct DetailViewByNav: View{
    let message : String
    
    var body: some View {
        Text("\(message)").font(.largeTitle)
    }
}


struct Nav: View {
    
    
//    @EnvironmentObject var model: UserModel
    @State var isPresented = false
    
    
    var body: some View {
        NavigationView {
            VStack{

                // 打开一个子页面。
                NavigationLink(destination: DetailViewByNav(message: "我是子页面。")) {
                    Text("显示详情")
                }.navigationTitle(Text("我是标题。"))
                
                
                // 打开一个子页面，并在子页面返回。
                NavigationLink(destination: Text("返回主页面").onTapGesture {
                    self.toggleValue()
                },isActive: $isPresented){
                 Text("跳转")
                }.padding()
                
            }
        }
        
    }
    
    func toggleValue() {
        self.isPresented.toggle()
    }
}

struct Nav_Previews: PreviewProvider {
    static var previews: some View {
        Nav()
    }
}
