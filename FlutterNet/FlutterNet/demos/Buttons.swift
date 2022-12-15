//
//  Buttons.swift
//  FlutterNet
//
//  Created by ldd on 2022/6/28.
//

import SwiftUI



//扩展
struct RoundedButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.black)
            .padding()
            .background(Color.yellow.cornerRadius(12))
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }

}

struct BorderButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label.foregroundColor(configuration.isPressed ? .blue : .red)
            .padding(8)
            .overlay(
                RoundedRectangle(cornerRadius: 10).stroke(Color.purple,lineWidth: 3))
            .onHover { hover in
                hover ? NSCursor.pointingHand.push() : NSCursor.pop()
            }
    }
}

struct DoubleTapButtonStyle : PrimitiveButtonStyle {
    
    @State private var taooed = false
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(taooed ? .yellow : .white)
            .padding(10)
            .background(Color.red.cornerRadius(8))
            .onTapGesture(count: 2) {
                taooed.toggle()
                configuration.trigger()
            }
    }
}





//按钮
struct ButtonsView: View {
    var body: some View {
        
        List{
            VStack(spacing: 20){
                Button("默认样式") {}
                
                Button("原生样式"){}.buttonStyle(PlainButtonStyle())
                
                Button("链接样式"){}.buttonStyle(LinkButtonStyle())
                
                Button("无边框按钮样式"){}.buttonStyle(BorderlessButtonStyle())
                
                Button("边框样式"){}.buttonStyle(BorderedButtonStyle())
                
                
                //组合按钮
                VStack{
                    Button("button 1"){}
                    Button("button 2"){}
                }
                .buttonStyle(LinkButtonStyle())
                
                Button("自定义按钮样式"){}.buttonStyle(BorderButtonStyle())
                
                Button("圆角按钮样式"){}.buttonStyle(RoundedButtonStyle())
                
                Button("短按按钮样式"){}.buttonStyle(DoubleTapButtonStyle())
                
                
            }
        }
    }
}

struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsView()
    }
}
