//
//  RotationEffectSpringDemo.swift
//  AnimationDemo
//
//  Created by ldd on 2022/1/4.
//

import SwiftUI

struct RotationEffectSpringDemo: View {
    @State var angle : Double = 0
    
    var body: some View {
        VStack {
            Image("we").resizable().frame(width: 200, height: 200)
                .rotationEffect(Angle.init(degrees: angle))
                .animation(.spring())
                .padding()
                
            Divider().fixedSize()
            
            Button(action: {
                self.angle += 90
            }, label: {
                Text("旋转90度")
            }).padding()
        }
        
    }
}

struct RotationEffectSpringDemo_Previews: PreviewProvider {
    static var previews: some View {
        RotationEffectSpringDemo()
    }
}
