//
//  TapGestureSingleTapDemo.swift
//  GestureDemo
//
//  Created by ldd on 2022/1/5.
//  点击圆放大效果

import SwiftUI

struct TapGestureSingleTapDemo: View {
    
    @State var isPressed = false
    
    var body: some View {
        
        
        let tapGesture = TapGesture()
            .onEnded( {
                self.isPressed.toggle()
            })
        
        
        return Circle()
            .fill(Color.orange)
            .frame(width: 240, height: 240)
            .gesture(tapGesture)
            .scaleEffect(isPressed ? 1.4 : 1)
            .animation(.default)
        
    }
}

struct TapGestureSingleTapDemo_Previews: PreviewProvider {
    static var previews: some View {
        TapGestureSingleTapDemo()
    }
}
