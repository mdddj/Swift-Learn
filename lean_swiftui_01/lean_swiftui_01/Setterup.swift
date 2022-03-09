//
//  Setterup.swift
//  lean_swiftui_01
//
//  Created by ldd on 2022/1/1.
//

import SwiftUI

struct Setterup: View {
    
    @State  var value: Double = 0
    
    var body: some View {
        VStack {
            Stepper(onIncrement: {
                self.value+=1
            }, onDecrement: {
                self.value-=1
            }, label:{
                Text("选择购买数量")
            })
            
            Text("选择的购买数量是:\(value)")
        }
    }
}

struct Setterup_Previews: PreviewProvider {
    static var previews: some View {
        Setterup()
    }
}
