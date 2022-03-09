//
//  ObjectBindingDemo.swift
//  LayoutDemo
//
//  Created by ldd on 2022/2/1.
//





import SwiftUI
import Foundation

struct ObjectBindingDemo: View {
    
    
    @ObservedObject var model = UserModel()
    @State var isPresented: Bool = false
    
    var dismissButton = Alert.Button.default(Text("ok")) {}
    var alert: Alert {
        Alert(title: Text("你的名字"), message: Text("\(self.model.nickName)"), dismissButton: dismissButton)
    }
    
    var body: some View {
        VStack {
            TextField("你的名字",text: $model.nickName).padding()
            Button(action: {
                self.isPresented = true
            }, label: {
                Text("show")
            }).alert(isPresented: $isPresented) { () -> Alert in
                alert
            }
            
        }
    }
}

struct ObjectBindingDemo_Previews: PreviewProvider {
    static var previews: some View {
        ObjectBindingDemo()
    }
}
