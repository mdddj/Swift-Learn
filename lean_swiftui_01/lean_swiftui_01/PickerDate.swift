//
//  PickerDate.swift
//  lean_swiftui_01
//
//  Created by ldd on 2021/12/31.
//

import SwiftUI

// 时间选择器的学习
struct PickerDate: View {
    
    
    // 用户选择的时间
    @State var selectDate = Date()
    
    var body: some View {
        VStack{
            
            // .hourAndMinute表示显示小时和分钟
            DatePicker("选择时间", selection: $selectDate, displayedComponents: .hourAndMinute ).padding()
            
            // .date 表示选择日期的模式
            DatePicker("选择时间", selection: $selectDate, displayedComponents: .date).padding()
        }
    }
}

struct PickerDate_Previews: PreviewProvider {
    static var previews: some View {
        PickerDate()
    }
}
