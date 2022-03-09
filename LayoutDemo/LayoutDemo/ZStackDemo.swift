//
//  ZStackDemo.swift
//  LayoutDemo
//
//  Created by ldd on 2022/1/5.
//

import SwiftUI

struct ZStackDemo: View {
    var body: some View {
        ZStack(alignment: .center) {
            Image("we").resizable().frame(width: 200, height: 200).clipShape(Circle())
            Text("梁典典").font(.system(size: 48)).foregroundColor(.white)
            Text("学习学习学习").font(.system(size: 14)).foregroundColor(.white)
                .offset(x: 0, y: 36)
        }.padding()
    }
}

struct ZStackDemo_Previews: PreviewProvider {
    static var previews: some View {
        ZStackDemo()
    }
}
