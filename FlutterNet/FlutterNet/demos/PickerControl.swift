//
//  PickerControl.swift
//  FlutterNet
//
//  Created by ldd on 2022/6/30.
//

import SwiftUI

struct PickerControl: View {
    
    let bands = ["梁典典","梁中典","梁小典"]
    @State private var selectedBand = 0
    @State private var selectedName = 0
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            //基本样式
            Picker("姓名",selection: $selectedBand){
                ForEach(0..<bands.count){
                    Text(self.bands[$0])
                }
            }
            
            //选项样式
            Picker("姓名",selection: $selectedBand) {
                ForEach(0..<bands.count) {
                    Text(self.bands[$0])
                }
            }
            .pickerStyle(RadioGroupPickerStyle())
            
            //选项卡
            Picker("姓名",selection: $selectedBand) {
                ForEach(0..<bands.count){
                    Text(self.bands[$0])
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Picker("姓名",selection: $selectedName) {
                Text("dddd").tag(0)
                Text("lllll").tag(1)
                Text("dddd").tag(2)
            }
            .fixedSize()
            
            Picker("姓名",selection: $selectedName){
                Text("dddd").tag(0)
                Text("lllll").tag(1)
                Text("dddd").tag(2)
            }
            .labelsHidden()
            .fixedSize()
            
            
        }
        .padding()
    }
}

struct PickerControl_Previews: PreviewProvider {
    static var previews: some View {
        PickerControl()
    }
}
