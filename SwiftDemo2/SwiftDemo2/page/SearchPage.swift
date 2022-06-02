//
//  SearchPage.swift
//  SwiftDemo2
//
//  Created by ldd on 2022/5/25.
//

import SwiftUI

struct SearchPage: View {
    
    @State var searchWorld: String = ""
    
    var body: some View {
        NavigationView {
            ScrollView{
                TextField("请输入搜索内容", text: $searchWorld)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }.navigationTitle(Text("搜索"))
                .padding()
        }
    }
}

struct SearchPage_Previews: PreviewProvider {
    static var previews: some View {
        SearchPage()
    }
}
