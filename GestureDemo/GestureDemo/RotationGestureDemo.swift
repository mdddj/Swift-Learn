//
//  RotationGestureDemo.swift
//  GestureDemo
//
//  Created by ldd on 2022/1/5.
//  自转动画

import SwiftUI

struct RotationGestureDemo: View {
    @State var angle = 0.0 //旋转角度值
    var body: some View {
        
        let rotationGesture = RotationGesture(minimumAngleDelta: Angle.init(degrees: 20))
            .onChanged({ a in
                print(a.animatableData)
                self.angle += a.animatableData
            }).onEnded{ a in
                print(self.angle)
                
            }
        
        return Image("we").resizable().frame(width: 240, height: 240)
            .gesture(rotationGesture)
            .rotationEffect(Angle(degrees: self.angle))
    }
}

struct RotationGestureDemo_Previews: PreviewProvider {
    static var previews: some View {
        RotationGestureDemo()
    }
}
