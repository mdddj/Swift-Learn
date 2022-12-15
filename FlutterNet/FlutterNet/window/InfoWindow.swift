//
//  InfoWindow.swift
//  FlutterNet
//
//  Created by ldd on 2022/6/29.
//

import SwiftUI

struct InfoWindow: View {
    var body: some View {
        VStack{
            Text("我是新的窗口")
        }
        .frame(width: 400, height: 400)
    }
}

struct InfoWindow_Previews: PreviewProvider {
    static var previews: some View {
        InfoWindow()
    }
}
