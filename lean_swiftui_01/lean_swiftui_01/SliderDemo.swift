//
//  SliderDemo.swift
//  lean_swiftui_01
//
//  Created by ldd on 2022/1/1.
//

import SwiftUI

struct SliderDemo: View {
    
    @State private var value:Double = 0
    var body: some View {
        VStack {
            Slider(value:$value ).padding()
            
            Slider(value: $value,in: -30...100,step: 2).padding()
            
            Slider(value: $value,in: 40...100,step: 3){ (item) in
                print(item)
            }.padding()
            
            Text("你的选择是:\(value)")
        }
    }
}

struct SliderDemo_Previews: PreviewProvider {
    static var previews: some View {
        SliderDemo()
    }
}
