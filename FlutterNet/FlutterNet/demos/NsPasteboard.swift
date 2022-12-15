//
//  NsPasteboard.swift
//  FlutterNet
//
//  Created by ldd on 2022/6/29.
//

import SwiftUI

//粘贴板
struct NsPasteboard: View {
    @State var name = ""
    var body: some View {
        VStack(spacing: 20){
            Text("在输入框中输入一段文本,然后点击按钮将输入框的文本复制到剪贴板")
            
            
         TextField("输入文本内容",text: $name)
                .multilineTextAlignment(.center)
            
            Button("复制文本"){
                let pb = NSPasteboard.general
                pb.clearContents()
                pb.setString(self.name, forType: .string)
            }
        }
        .padding()
    }
}

struct NsPasteboard_Previews: PreviewProvider {
    static var previews: some View {
        NsPasteboard()
    }
}
