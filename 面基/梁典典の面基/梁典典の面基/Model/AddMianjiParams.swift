//
//  AddMianjiParams.swift
//  梁典典の面基
//
//  Created by ldd on 2022/9/17.
//

import Foundation


struct AddMianjiParams : Encodable {
    
    ///面基标题
    var aboutDiandian: String = ""
    
    ///居住地
    var location: String = ""
    
    ///年龄段index
    var age: Int = -1
    
    
    ///面基备注
    var mianjiInfo: String = ""
    
    ///soul昵称
    var soulName: String = ""
    
    ///姓名
    var name: String = ""
    
    ///面基状态,0 表示还没有面基
    var state: Int = 0
    
    var parameters : [String:Any] {
        return [
            "aboutDiandian":aboutDiandian,
            "location":location,
            "age":age,
            "mianjiInfo":mianjiInfo,
            "soulName":soulName,
            "name":name,
            "state":state
        ]
    }
}
