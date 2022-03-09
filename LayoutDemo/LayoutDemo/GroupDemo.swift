//
//  GroupDemo.swift
//  LayoutDemo
//
//  Created by ldd on 2022/1/5.
//

import SwiftUI

struct GroupDemo: View {
    var body: some View {
        Group {
            Text("Apple")
            Text("Banana")
            Text("Orange")
            Text("Watermelon")
            Text("Grape")
            Text("Papaya")
            Text("Pear")
        }
        .font(.title)
        .foregroundColor(.green)
        .padding()
    }
}

struct GroupDemo_Previews: PreviewProvider {
    static var previews: some View {
        GroupDemo()
    }
}
