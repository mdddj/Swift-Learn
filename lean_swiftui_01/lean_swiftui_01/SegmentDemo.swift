//
//  SegmentDemo.swift
//  lean_swiftui_01
//
//  Created by ldd on 2022/1/1.


// 分段菜单的使用

import SwiftUI

struct SegmentDemo: View {
    
    
    private var list = ["Swift","Objective-c","Java"]
    private var colors = [Color.yellow,Color.blue,Color.green]
    @State var selectValue: Int = 0
    
    
    
    var body: some View {
        VStack {
            Picker(selection: $selectValue,  label: Text("选择你喜欢的语言")) {
                ForEach(0 ..< list.count){
                    Text(self.list[$0]).tag($0)
                }
            }.pickerStyle(SegmentedPickerStyle()).padding()
            Text("你选择的喜欢语言是\(self.list[selectValue])")
        }
    }
}

struct SegmentDemo_Previews: PreviewProvider {
    static var previews: some View {
        SegmentDemo()
    }
}
