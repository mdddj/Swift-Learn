//
//  ScaleEffectDefaultDemo.swift
//  AnimationDemo
//
//  Created by ldd on 2022/1/4.
// 实现一个基础动画

import SwiftUI

struct ScaleEffectDefaultDemo: View {
    
    @State private var scaleEffectValue : Double = 1
    
    var body: some View {
        VStack {
            Image("we")
                .resizable().frame(width: 200, height: 200)
                .scaleEffect(scaleEffectValue)
                .animation(.default)
            
            Divider().fixedSize()
            
            Button("放大"){
                self.scaleEffectValue = self.scaleEffectValue + 0.2
            }
            Button("还原"){
                self.scaleEffectValue = 1
            }
        }
    }
}

struct ScaleEffectDefaultDemo_Previews: PreviewProvider {
    static var previews: some View {
        ScaleEffectDefaultDemo()
    }
}
