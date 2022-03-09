//
//  ContentView.swift
//  LayoutDemo
//
//  Created by ldd on 2022/1/5.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        let user = UserModel()
//        user.nickName = "梁典典"
//       return EnviromentObjectDemo().environmentObject(user)
        
        let model1 = InfoModel(description: "A lady with a horse", pictureName: "we")
        let model2 = InfoModel(description: "An African animal with a very long neck", pictureName: "we")
        PageListDemo(msg: [model1,model2])
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
