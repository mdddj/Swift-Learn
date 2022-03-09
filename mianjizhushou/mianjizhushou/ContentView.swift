//
//  ContentView.swift
//  mianjizhushou
//
//  Created by ldd on 2022/2/9.
//

import SwiftUI
import Alamofire

let IP = "http://192.168.199.74"

struct PageModel : Encodable {
    var page: Int
    var pageSize: Int
}

struct  UserAvatarImage: View {
    
    var body: some View {
        NavigationLink(destination: LoginView()) {
            Image(systemName: "person")
        }
    }
}

struct ContentView: View {
    
    
    
    
    var body: some View {
        NavigationView {
            List {
                
            }.navigationTitle("典典面基助手").navigationBarItems(trailing: UserAvatarImage())
        }
        .onAppear(perform: loadList)
    }
    
    func loadList() {
        let pageModel = PageModel(page: 0,pageSize: 10)
        AF.request("\(IP)/api/mianji/list",
                   method:.get,
                   parameters: pageModel).responseDecodable(of: MianjiListResult.self) { response in
            print(response)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
