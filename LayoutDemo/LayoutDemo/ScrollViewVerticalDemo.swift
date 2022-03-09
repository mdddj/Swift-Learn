//
//  ScrollViewVerticalDemo.swift
//  LayoutDemo
//
//  Created by ldd on 2022/1/5.
//  垂直滚动列表

import SwiftUI

struct ScrollViewVerticalDemo: View {
    
    @State var languages = ["SwiftUI","Objective-C","Flutter","Java","Go","C","C++"]
    
    var body: some View {
        ScrollView(.vertical,showsIndicators: false) {
            VStack(alignment: HorizontalAlignment.leading, spacing: 20) {
                Text("Overview")
                    .font(.system(size: 48)).padding(10)
                Text("With the power of Xcode, the ease of Swift, and the revolutionary features of cutting-edge Apple technologies, you have the freedom to create your most innovative apps ever.\nSwiftUI provides views, controls, and layout structures for declaring your app's user interface. The framework provides event handlers for delivering taps, gestures, and other types of input to your app, and tools to manage the flow of data from your app's models down to the views and controls that users will see and interact with.")
                    .lineLimit(nil)
                    .frame(width: 300, height: 240, alignment: .topLeading)
                    .padding(10)
                
                Image("we")
                    .resizable()
                    .frame(width: 300, height: 300, alignment: .center)
            }
        }
        .background(.orange)
        .padding(10)
        .navigationTitle(Text("ScrollView"))
    }
}

struct ScrollViewVerticalDemo_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewVerticalDemo()
    }
}
