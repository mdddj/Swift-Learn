//
//  SpeadAndDelayDemo.swift
//  AnimationDemo
//
//  Created by ldd on 2022/1/5.
// 动画延迟
//

import SwiftUI

struct SpeadAndDelayDemo: View {
    
    @State var factor: Double = 1.0
    
    var animation: Animation {
        Animation.linear(duration: 1)
            .delay(2) //延迟两秒
    }
    
    var body: some View {
        VStack {
            Image("we").resizable().frame(width: 120, height: 120)
                .scaleEffect(CGFloat(factor))
                .animation(animation)
            
            Divider()
            
            Button(action: {
                self.factor += 0.2
            }, label: {
                Text("放大")
            })
        }
    }
}

struct SpeadAndDelayDemo_Previews: PreviewProvider {
    static var previews: some View {
        SpeadAndDelayDemo()
    }
}
