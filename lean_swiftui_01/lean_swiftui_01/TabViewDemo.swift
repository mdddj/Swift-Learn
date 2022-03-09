//
//  TabViewDemo.swift
//  lean_swiftui_01
//
//  Created by ldd on 2022/1/4.
//

import SwiftUI

struct TabViewDemo: View {
    var body: some View {
        TabView {
            Text("首页").font(.system(size: 36))
                .tabItem({
                    Image(systemName: "house")
                    Text("首页")
                })
            Text("个人中心").font(.system(size: 36))
                .tabItem({
                    Image(systemName: "person")
                    Text("我的")
                })
        }
    }
}

struct TabViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        TabViewDemo()
    }
}
