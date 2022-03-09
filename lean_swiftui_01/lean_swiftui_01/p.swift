//
//  p.swift
//  lean_swiftui_01

// 段落的学习。
//
//  Created by ldd on 2021/12/7.
//

import SwiftUI


struct P: View {
    var body: some View {
        VStack{
            
            Text("开始了愉快的段落学习之旅，梁典典的博客。")
            
            /// tracking , 看起来好像可以增加字符之间的间距呢。
            Text("开始了愉快的段落学习之旅，梁典典的博客。").tracking(10)
            
            /// kerning
            /// 文档的解释是：设置字符之间的间距或字距。好像和上面的差不多，但又不一样
            Text("开始了愉快的段落学习之旅，梁典典的博客。").kerning(10)
            
            /// blur： 给文字添加一个模糊效果。
            Text("开始了愉快的段落学习之旅，梁典典的博客。").blur(radius: 1)
            
            /// [lineSpacing] 设置一个段落的行艰巨。
            /// [lineLimit] 设置段落最大显示多少行。后面补充三个小数点
            Text("开始了愉快的段落学习之旅，梁典典的博客。开始了愉快的段落学习之旅，梁典典的博客。").lineSpacing(20).lineLimit(1)
            
            /// offset： 给文字添加一个模糊效果。
            /// 这个很好理解，段落在原始位置上便宜一段距离。
            Text("开始了愉快的段落学习之旅，梁典典的博客。").offset(x: 20, y: 0)
            
            ///frame: 给段落设置一个区块，并指定区块的宽和高
            ///alignment: 文字的对其方式。
            ///bottomTrailing:底部右边对其
            ///bottomLeading: 底部左对齐。
            Text("开始了愉快的段落学习").frame(width: 200, height: 100, alignment: .bottomLeading)
                .background(.yellow)
            
            ///多行文本对其方式
            Text("开始了愉快的段落学习之旅，梁典典的博客。\n1。多行对其").multilineTextAlignment(.center)
            
        }
    }
}

struct p_Previews: PreviewProvider {
    static var previews: some View {
        P()
    }
}
