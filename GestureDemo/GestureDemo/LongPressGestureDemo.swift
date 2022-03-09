//
//  LongPressGestureDemo.swift
//  GestureDemo
//
//  Created by ldd on 2022/1/5.
//

import SwiftUI

struct LongPressGestureDemo: View {
    
    // 是否长按中
    @GestureState var isLongPressed = false
    
    var body: some View {
        let longPressedGesture = LongPressGesture().updating($isLongPressed) {value,state,tr in
            print("value=\(value) state=\(state)")
            state = value
        }
            .onEnded { value in
                print(value)
            
            }
        
        return Circle()
            .fill(Color.green)
            .frame(width: 240, height: 240)
            .gesture(longPressedGesture)
            .scaleEffect(isLongPressed ? 3:1)
            .animation(.spring())
    }
}

struct LongPressGestureDemo_Previews: PreviewProvider {
    static var previews: some View {
        LongPressGestureDemo()
    }
}
