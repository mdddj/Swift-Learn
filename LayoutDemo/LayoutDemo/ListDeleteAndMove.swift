//
//  ListDeleteAndMove.swift
//  LayoutDemo
//
//  Created by ldd on 2022/1/5.
//  删除和移动

import SwiftUI

struct ListDeleteAndMove: View {
    
    @State var languages = ["SwiftUI","Objective-C","Flutter","Java","Go","C","C++"]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(languages,id: \.self) {language in
                    Text(language)
                }.onMove(perform: moveItem).onDelete(perform: deleteItem)
            }
            .navigationTitle(Text("语言列表"))
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                EditButton()
            }
        }
    }
    
    func deleteItem(from item:IndexSet) {
         if let first = item.first {
            languages.remove(at: first)
        }
    }
    
    func moveItem(from item: IndexSet,to index: Int) {
        languages.move(fromOffsets: item, toOffset: index)
    }
}

struct ListDeleteAndMove_Previews: PreviewProvider {
    static var previews: some View {
        ListDeleteAndMove()
    }
}
