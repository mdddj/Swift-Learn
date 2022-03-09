//
//  PickerDemo.swift
//  lean_swiftui_01
//
//  Created by ldd on 2021/12/31.

//



import SwiftUI


// 选择器的学习
struct PickerDemo: View {
    
    
    
    // 第一步，声明一些选项
    let  helloWorld: [String] = ["Java","PHP","FLUTTER","REACT","OBJECTIVE-C","SWIFT"]
    let colors:[Color] = [Color.orange,Color.yellow,Color.blue,Color.green,Color.red,Color.gray]
    
    @State private var selectItem = 0
    

    var body: some View {
        
        
        VStack{
            Picker(selection: $selectItem, label: Text("选择你喜欢的编程语言")) {
                ForEach(0 ..< helloWorld.count) {
                    Text(self.helloWorld[$0]).tag($0).foregroundColor(self.colors[$0])
                }
            }
            Text("你的选择是:\(helloWorld[selectItem])").foregroundColor(colors[selectItem])
        }
        
    }
}

struct PickerDemo_Previews: PreviewProvider {
    static var previews: some View {
        PickerDemo()
    }
}
