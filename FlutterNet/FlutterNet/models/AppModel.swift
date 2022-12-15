//
//  AppModel.swift
//  FlutterNet
//
//  Created by ldd on 2022/9/9.
//

import Combine
import Kodable
import Foundation


class AppModel : ObservableObject {
    
    @Published private(set) var categorys: [Category] = [Category]()
    
    ///加载全部的分类数据
    func loadAllCategorys() {
        MyHttpUtil.request(API.getAllCategorys) { data in
            
                print("获取到数据\n\(data)\n")
                let catesData = try! data["data"].arrayValue.encodeJSON()
                let cates = try! JSONDecoder().decode([Category].self,from:catesData)
                self.categorys = cates
            
        } failure: { code, msg in
            print("请求数据失败:\(code) \(msg)")
        }

    }
}


struct Category: Kodable {
    @Coding("id") var id: Int
    @Coding("name") var name: String
}
