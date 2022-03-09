//
//  OffsetEaseOutDemo.swift
//  AnimationDemo
//
//  Created by ldd on 2022/1/4.
//

import SwiftUI

struct OffsetEaseOutDemo: View {
    @State private var distance: Double  = 0
    var body: some View {
        Image("we").resizable().frame(width: 200, height: 200)
            .offset(x: 0,y: CGFloat(distance))
            .animation(.easeOut(duration: 1.0))
        Divider()
        Button("移动它") {
            self.distance -= 50
        }
        Button("还原"){
            self.distance = 0
        }
        
    }
}

struct OffsetEaseOutDemo_Previews: PreviewProvider {
    static var previews: some View {
        OffsetEaseOutDemo()
    }
}
