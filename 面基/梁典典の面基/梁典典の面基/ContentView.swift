//
//  ContentView.swift
//  梁典典の面基
//
//  Created by ldd on 2022/9/17.
//

import SwiftUI


enum HomeTab {
    case list
    case user
}

struct ContentView: View {
    
    @State private var selection : HomeTab = .list
    
    var body: some View {
        NavigationView {
            TabView(selection: $selection) {
                HomeList().tabItem {
                    Label("首页",systemImage: "house")
                }.tag(HomeTab.list)
                UserCenter().tabItem {
                    Label("我的", systemImage: "person")
                }.tag(HomeTab.user)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
