//
//  ApiDemo.swift
//  LayoutDemo
//
//  Created by ldd on 2022/1/7.
//

import SwiftUI
import Alamofire


struct LoginParam : Encodable{
    let loginNumber: String
    let password: String
}

struct ApiDemo: View {
    
    
    @State var username: String = ""
    @State var userName: String = ""
    @State var age: String = ""
    @State var address: String = ""
    @State var aa = false
    
    var body: some View {
        NavigationView {
            VStack {
                Form{
                    Section(header: Text("填写申请信息")){
                        TextField("SOUL用户名",text: $username)
                        TextField("姓氏",text: $username)
                        TextField("年龄",text: $age)
                        TextField("你在广州那个区？(地铁站)",text: $address)
                    }
                    Section(header: Text("面基前准备")){
                        TextField("你希望和典典在哪面基？（面基地点）",text: $username)
                        TextField("面基事项。(典典喜欢爬山，看电影，逛街。)",text: $username)
                        TextField("当天面完几点回家？",text: $age)
                        Toggle(isOn: $aa) {
                            Text("如果存在消费，是否AA？")
                        }
                        Toggle(isOn: $aa) {
                            Text("是否支持处对象？")
                        }
                        Toggle(isOn: $aa) {
                            Text("是否可以拥抱？")
                        }
                        Toggle(isOn: $aa) {
                            Text("我只想孤独的时候有人陪伴，仅次而且。(开启后获得隐藏彩蛋)")
                        }
                    }
                    Section {
                        Button(action: {
              
                            login()
                            
                        }, label: {
                            HStack{
                                Text("申请和典典面基")
                                
                            }
                                
                        })
                    }
                    
                   
              
                }
                .navigationTitle(Text("典典面基助手"))
                .toolbar(content: {
                    
                    NavigationLink(destination: LoginPage(), label: {
                        Text("登录")
                    })
                })
                .navigationBarTitleDisplayMode(.large)
            }
        }
       
    }
    
    
    //登录
    func login(){
        let loginParams = LoginParam(loginNumber: username, password: username)
        AF.request("http://192.168.199.89/api/user/login",
                   method: .post,
                   parameters: loginParams,
                   encoder: JSONParameterEncoder.default
        ).responseData { response in
            
        }
        
    }
}

struct ApiDemo_Previews: PreviewProvider {
    static var previews: some View {
        ApiDemo()
    }
}
