//
//  ContentView.swift
//  典典面基小助手
//
//  Created by ldd on 2022/2/9.
//

import SwiftUI
import Alamofire

let IP = "http://127.0.0.1"

struct PageModel : Encodable {
    var page: Int
    var pageSize: Int
}

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
    
    func loadList() {
        let pageModel = PageModel(page: 0,pageSize: 0)
        AF.request("\(IP)/api/mianji/list",method:.get, parameters: pageModel,encoder: JSONParameterEncoder.default).response { (response: AFDataResponse<Data?>) in
            print(response.data ?? "获取数据失败")
       }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
