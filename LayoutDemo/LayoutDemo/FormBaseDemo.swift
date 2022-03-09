//
//  FormBaseDemo.swift
//  LayoutDemo
//
//  Created by ldd on 2022/1/5.
//  表单基本组件

import SwiftUI

struct FormBaseDemo: View {
    
    
    private var languages = ["Swift","Objective-C"]
    @State private var selectedLanguage = 0
    @State var workingYear: Double = 2
    @State var enableNotification = false
    
    var body: some View {
        
        NavigationView {
            Form {
                Picker(selection: $selectedLanguage, label: Text("Languages")) {
                    ForEach(0 ..< languages.count) {
                        Text(self.languages[$0]).tag($0)
                    }
                }.pickerStyle(SegmentedPickerStyle())
                HStack{
                    Text("工作经验")
                    Slider(value: $workingYear,in: 1...10,step: 1)
                    
                }
                Toggle(isOn: $enableNotification){
                    Text("开启消息提醒")
                }
                Button (action: {
                    print("你选择的编程语言是\(self.languages[self.selectedLanguage])")
                    print("你的工作经验是\(Int(self.workingYear))")
                    print("消息提醒是否开启：\(self.enableNotification)")
                }){
                    Text("提交")
                }
            }.navigationBarTitle(Text("简历资料填写"))
        }
    }
}

struct FormBaseDemo_Previews: PreviewProvider {
    static var previews: some View {
        FormBaseDemo()
    }
}
