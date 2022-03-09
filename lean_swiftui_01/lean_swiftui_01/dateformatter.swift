//
//  dateformatter.swift
//  lean_swiftui_01
//
//  Created by ldd on 2021/12/25.
//


// 对时间进行格式化。
import SwiftUI

struct dateformatter: View {
    
    
    var now = Date()
    
    static let dataFormatter : DateFormatter = {
        let dataformatter = DateFormatter()
        dataformatter.dateStyle = .long
        return dataformatter
    }()
    
    var body: some View {
        Text("现在时间是：\(now,formatter: Self.dataFormatter)")
            .font(.title)
            .padding()
    }
}

struct dateformatter_Previews: PreviewProvider {
    static var previews: some View {
        dateformatter()
    }
}
