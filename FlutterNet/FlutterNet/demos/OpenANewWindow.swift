//
//  OpenANewWindow.swift
//  FlutterNet
//
//  Created by ldd on 2022/6/29.
//

import SwiftUI

struct OpenANewWindow: View {
    var body: some View {
        VStack {
            Text("点击下方按钮打开关于我窗口")
            
            Button("打开窗口"){
                if let url = URL(string: "windowapp://infowindow") {
                    NSWorkspace.shared.open(url)
                }
            }
        }
    }
}

struct OpenANewWindow_Previews: PreviewProvider {
    static var previews: some View {
        OpenANewWindow()
    }
}
