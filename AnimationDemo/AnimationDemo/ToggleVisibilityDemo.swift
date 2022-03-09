//
//  ToggleVisibilityDemo.swift
//  AnimationDemo
//
//  Created by ldd on 2022/1/5.
//

import SwiftUI

struct ToggleVisibilityDemo: View {
    
    @State var showingPassword = false
    @State var password = ""
    
    var body: some View {
        
        
        VStack {
            Toggle(isOn: $showingPassword.animation(.spring()), label: {
                Text("显示密码")
            })
            
            if showingPassword {
                TextField("Password",text: $password)
                    .padding()
                    .border(Color.green,width: 1)
            }
        }
        .padding()
        
    }
}

struct ToggleVisibilityDemo_Previews: PreviewProvider {
    static var previews: some View {
        ToggleVisibilityDemo()
    }
}
