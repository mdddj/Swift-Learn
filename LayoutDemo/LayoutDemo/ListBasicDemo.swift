//
//  ListBasicDemo.swift
//  LayoutDemo
//
//  Created by ldd on 2022/1/5.
//  基本的列表显示

import SwiftUI

struct ListBasicDemo: View {
    var body: some View {
        List {
            Text("Swift UI")
            Text("Objective-C")
            Text("Flutter")
        }
    }
}

struct ListBasicDemo_Previews: PreviewProvider {
    static var previews: some View {
        ListBasicDemo()
    }
}
