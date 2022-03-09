//
//  CombenidAnimation.swift
//  AnimationDemo
//
//  Created by ldd on 2022/1/5.
// 组合动画

import SwiftUI

struct CombenidAnimation: View {
    
    
    @State var radius : Double = 0
    @State var brightness: Double = 0
    
    
    var body: some View {
        
        VStack {
            Image("we").resizable().frame(width: 120, height: 120)
                .shadow(radius: CGFloat(radius))
                .brightness(brightness)
                .animation(.linear(duration: 2))
            
            Divider().fixedSize()
            
            Button(action: {
                self.radius += 10
                self.brightness  = 1
            }, label: {
                Text("执行动画")
            })
            Divider()
            Button(action: {
                self.radius  = 0
                self.brightness  = 0
            }, label: {
                Text("还原")
            })
        }
        
    }
}

struct CombenidAnimation_Previews: PreviewProvider {
    static var previews: some View {
        CombenidAnimation()
    }
}
