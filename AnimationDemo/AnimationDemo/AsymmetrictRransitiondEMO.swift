//
//  AsymmetrictRransitiondEMO.swift
//  AnimationDemo
//
//  Created by ldd on 2022/1/5.
//

import SwiftUI

struct AsymmetrictRransitiondEMO: View {
    @State var showPicture = false
    
    var body: some View {
        VStack {
            
            Button(action: {
                withAnimation{
                    self.showPicture.toggle()
                }
                }, label: {
                Text("显示图片")
            })
            
            
            if(showPicture) {
                Image("we")
                    .resizable().frame(width: 120, height: 120)
                    .transition(AnyTransition.scale(scale: 0).combined(with: .slide))
                
            }
            
        }
    }
}

struct AsymmetrictRransitiondEMO_Previews: PreviewProvider {
    static var previews: some View {
        AsymmetrictRransitiondEMO()
    }
}
