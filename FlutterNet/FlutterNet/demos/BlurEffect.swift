//
//  BlurEffect.swift
//  FlutterNet
//
//  Created by ldd on 2022/6/28.
//

import SwiftUI

///模糊效果
struct BlurEffect: View {
    
    
    @State private var blurRadius: CGFloat = 0.0
    
    var body: some View {
        VStack(spacing: 40) {
            Text("梁典典 ☺️")
                .font(.title)
                .blur(radius: blurRadius)
            
            Button("我的按钮"){}
                .blur(radius: blurRadius)
            
            Slider(value: $blurRadius,in: 0...20,minimumValueLabel: Text("0"),maximumValueLabel: Text("20")){
                Text("Blur radius")
            }
            .padding()
                
        }
    }
}

struct BlurEffect_Previews: PreviewProvider {
    static var previews: some View {
        BlurEffect()
    }
}
