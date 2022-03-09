//
//  HStackDemo.swift
//  LayoutDemo
//
//  Created by ldd on 2022/1/5.
//

import SwiftUI

struct HStackDemo: View {
    var body: some View {
        HStack {
            Image(systemName: "book.fill")
            Text("梁典典的学习SwiftUI之路")
            Spacer()
            Image(systemName: "icloud.and.arrow.down")
        }.padding()
    }
}

struct HStackDemo_Previews: PreviewProvider {
    static var previews: some View {
        HStackDemo()
    }
}
