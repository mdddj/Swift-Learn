//
//  WebViewDemo.swift
//  lean_swiftui_01
//
//  Created by ldd on 2022/1/4.
//webview的示例

import SwiftUI
import WebKit

struct WebViewDemo: UIViewRepresentable {
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: URL(string: "https://baidu.com")!)
        uiView.load(request)
    }
    
    typealias UIViewType = WKWebView
    
    
    
   
    
    

    
    
    
}

struct WebViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        WebViewDemo()
    }
}
