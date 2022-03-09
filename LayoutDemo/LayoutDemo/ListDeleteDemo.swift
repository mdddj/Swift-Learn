//
//  ListDeleteDemo.swift
//  LayoutDemo
//
//  Created by ldd on 2022/1/5.
//

import SwiftUI

struct ListDeleteDemo: View {
    
    @State var languages = ["SwiftUI","Objective-C","Flutter"]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(languages,id: \.self) { language in
                    Text(language)
                }
                .onDelete(perform: delete)
                
            }
        }
    }
    
    func delete(at offsets: IndexSet) {
        if let first = offsets.first {
            languages.remove(at: first)
        }
    }
}

struct ListDeleteDemo_Previews: PreviewProvider {
    static var previews: some View {
        ListDeleteDemo()
    }
}
