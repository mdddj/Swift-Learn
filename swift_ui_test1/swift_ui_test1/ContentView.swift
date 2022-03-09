//
//  ContentView.swift
//  swift_ui_test1
//
//  Created by ldd on 2021/11/2.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            
            MapView()
                .ignoresSafeArea( edges: .top)
                .frame(height: 300)
            
            
            CircleImage()
                .offset(y: -130)
                .padding(.bottom,-130)
            
            
            VStack{
                HStack {
                    VStack (alignment: .leading) {
                        Text("一号小镇")
                            .font(.title)
                        Text("位于广州市番禺区")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                    Text("已开放")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                Divider()
                Text("这里可以添加一些描述性的东西，可以加很多文字试试，哈哈哈")
                    .font(.title2)
            }
            .padding()
            
            Spacer()
            
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
