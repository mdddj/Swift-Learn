//
//  ContentView.swift
//  lean_swiftui_01
//
//  Created by 梁典典 on 2021/12/5.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            // 给文字设置成粗体模式。
            Text("https://itbug.shop。01").bold()
            
            // 给文字设置成斜体模式。
            Text("https://itbug.shop。02").italic()
            
            // 给文字添加一个下划线。
            Text("https://itbug.shop。03").underline()
            
            //给文字添加下划线，并添加一个颜色。
            // 第一个参数是一个布尔值，表示文字是否显示下划线。
            // 第二个参数是设置下划线的颜色
            Text("https://itbug.shop  04").underline(true,color: .red)
            
            // 给文字中间添加一个删除线
            Text("https://itbug.shop。05").strikethrough()
            
            // 给文字添加一个带有颜色的删除线
            // 参数一：布尔值，是否添加删除线，参数二： 删除线的颜色。
            Text("https://itbug.shop。06").strikethrough(true, color: .yellow)
            
            // 给文字的字体颜色
            Text("梁典典的博客。07").foregroundColor(.red)
            
            // 给文本设置一个背景图片。并向上撑开5个单位，背景有一个黄色渐变
            Text("https://itbug.shop。08").baselineOffset(CGFloat(5)).background(Image("swift"),alignment: .bottom)
            
            
            
            
            
            // 设置文字的字体相关
            VStack{
                
                
                //具有脚注文本样式的字体。字体看起来比较小
                Text("梁典典的博客 01").font(.footnote)
                
                // 指定文字大小
                Text("典典的小卖部。02").font(.system(size: 32))
                
                // 显示一个标题样式。monospaced： 是一种等宽字体。
                Text("典典的小卖部 03").font(.system(.title, design: .monospaced))
                
                // 下面来使用一种自定义的字体。可能需要引入字体文件才能显示出效果
                Text("hello world,this is a custom font text 04").font(.custom("Fira Code", size: 22))
                
                // 设置字体为粗体文本
                Text("典典的小卖部 05").fontWeight(Font.Weight.heavy)
                
                // 设置字体为比较淡一点的粗体,文字颜色会变成灰色
                Text("典典的小卖部 hello world 06").fontWeight(Font.Weight.ultraLight)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
