//
//  space.swift
//  lean_swiftui_01
//
//  Created by ldd on 2021/12/25.
//

// 撑开组件。

import SwiftUI

struct space: View {
    var body: some View {
        VStack {
            
            
            HStack {
                Image(systemName: "clock")
                Spacer()
                Text("来点文字")
            }
            
            
            HStack {
                Image(systemName: "clock")
                Spacer()
                Text("\(Date())")
            }
            .padding()
            
            
            //minLength最少多少长度
            HStack {
                Image(systemName: "clock")
                Spacer(minLength: 50)
                Text("\(Date())")
            }
            .padding()
            
            
            // Divider 就一个普通的分割线。
            VStack {
                Image(systemName: "clock")
                Divider()
                Text("\(Date())")
            }
            .padding()
            
            VStack {
                Image(systemName: "clock")
                Divider().background(.yellow).scaleEffect(CGSize(width: 1, height: 15))
                Text("\(Date())")
            }
            .padding()
            
            
        }
    }
}

struct space_Previews: PreviewProvider {
    static var previews: some View {
        space()
    }
}
