//
//  ListMoveDemo.swift
//  LayoutDemo
//
//  Created by ldd on 2022/1/5.
//

import SwiftUI

struct ListMoveDemo: View {
    
    @State var languages = ["SwiftUI","Objective-C","Flutter","Java","Go","C","C++"]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(languages,id:\.self) { language in
                    Text(language)
                }.onMove(perform: { (source,destination) in
                    self.moveItem(from: source, to: destination)
                })
            }
            .navigationTitle(Text("编辑项目"))
            .navigationBarTitleDisplayMode(.large)
            .toolbar{
                EditButton()
            }
        }
    }
    
    // 删除方法
    func moveItem(from source: IndexSet,to destination:Int){
        languages.move(fromOffsets: source, toOffset: destination)
        
    }
}

struct ListMoveDemo_Previews: PreviewProvider {
    static var previews: some View {
        ListMoveDemo()
    }
}
