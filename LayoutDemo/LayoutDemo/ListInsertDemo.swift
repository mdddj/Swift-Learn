//
//  ListInsertDemo.swift
//  LayoutDemo
//
//  Created by ldd on 2022/1/5.
//

import SwiftUI

struct ListInsertDemo: View {
    @State var languages = ["SwiftUI","Objective-C","Flutter"]
    var body: some View {
        NavigationView {
            List {
                ForEach(languages,id: \.self){ language in
                    Text(language)
                }.onInsert(of: ["Demo"], perform: { (offset,message) in
                    print(offset)
                })
            }
            .navigationTitle(Text("编辑测试"))
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                EditButton()
            }
        }
    }
    
    func insertItem(to offsets:Int,message: [NSItemProvider]) {
        languages.insert(message[0].description, at: offsets)
    }
}

struct ListInsertDemo_Previews: PreviewProvider {
    static var previews: some View {
        ListInsertDemo()
    }
}
