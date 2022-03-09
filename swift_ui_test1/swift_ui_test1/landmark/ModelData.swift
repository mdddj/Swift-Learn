//
//  ModelData.swift
//  swift_ui_test1
//
//  Created by ldd on 2021/11/5.
//

import Foundation

var landmarks:[Landmark] = load("landmarkData.json")


func load<T: Decodable>(_ fileName: String) -> T {
    let data : Data
    
    guard let file = Bundle.main.url(forResource: fileName, withExtension: nil)
    else {
        fatalError("无法找到【\(fileName)】文件")
    }
    
    do {
        data = try Data(contentsOf: file)
    }catch {
        fatalError("无法从获取到数据by\(fileName)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }catch {
        fatalError("无法转换json数据：\(fileName),\(T.self) \n \(error)")
    }
    
}
