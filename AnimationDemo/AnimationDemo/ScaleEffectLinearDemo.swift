//
//  ScaleEffectLinearDemo.swift
//  AnimationDemo
//
//  Created by ldd on 2022/1/4.
//

import SwiftUI

struct ScaleEffectLinearDemo: View {
    @State private var s : Double = 1
    @State private var v : Double = 1
    
    var body: some View {
        Image("we").resizable()
            .scaleEffect(CGFloat(s))
            .opacity(v)
            .frame(width: 200, height: 200)
            .onTapGesture {
                withAnimation(.linear(duration: 1.0)) {
                    self.s+=0.1
                    self.v-=0.2
                }
            }
    }
}

struct ScaleEffectLinearDemo_Previews: PreviewProvider {
    static var previews: some View {
        ScaleEffectLinearDemo()
    }
}
