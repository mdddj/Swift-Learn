//
//  VStackDemo.swift
//  LayoutDemo
//
//  Created by ldd on 2022/1/5.
//

import SwiftUI

struct VStackDemo: View {
    var body: some View {
        VStack {
            Text("梁典典的学习SwiftUI之路")
            Image("we").resizable().frame(width: 200, height: 200)
            Text("这个组件是垂直摆放的")
        }
    }
}

struct VStackDemo_Previews: PreviewProvider {
    static var previews: some View {
        VStackDemo()
    }
}
