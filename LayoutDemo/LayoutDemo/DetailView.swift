//
//  DetailView.swift
//  LayoutDemo
//
//  Created by ldd on 2022/2/1.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var userModel: UserModel
    var body: some View {
        Text("你的名字是: \(userModel.nickName)")
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
