//
//  WritePage.swift
//  SwiftDemo2
//
//  Created by ldd on 2022/5/25.
//

import SwiftUI

struct WritePage: View {
    @State private var fullText: String = "你好呀"

    var body: some View {
        NavigationView {
            VStack {
                // 编辑器
                TextEditor(text: $fullText)
                    .foregroundColor(.gray)
                    .font(.custom("Helvetica Neue", size: 15))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .lineSpacing(5)
                
              
                
                   

            }
            .navigationTitle(Text("发布动态"))
            .padding()
        }
     
    }
}

struct WritePage_Previews: PreviewProvider {
    static var previews: some View {
        WritePage()
    }
}
