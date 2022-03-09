//
//  TapGestureDoubleTapDemo.swift
//  GestureDemo
//
//  Created by ldd on 2022/1/5.
//  双击效果

import SwiftUI

struct TapGestureDoubleTapDemo: View {
    @State var isPressed = false // 是否已经点击
    var body: some View {
        return Circle()
            .fill(Color.green)
            .frame(width: 240, height: 240)
            .scaleEffect(isPressed ? 1.4 : 1)
            .animation(.spring())
            .onTapGesture(count: 2) {
                self.isPressed.toggle()
                print("点击完毕")
            }
    }
}

struct TapGestureDoubleTapDemo_Previews: PreviewProvider {
    static var previews: some View {
        TapGestureDoubleTapDemo()
    }
}
