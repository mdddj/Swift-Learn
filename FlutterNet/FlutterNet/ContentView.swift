//
//  ContentView.swift
//  FlutterNet
//
//  Created by ldd on 2022/6/14.
//

import SwiftUI

struct ViewC: View {
    var body: some View {
        Text("View C 🍑").font(.title)
    }
}

struct ContentView: View {
    @AppStorage("savedSelection") private var savedSelection: String?
    
    @EnvironmentObject var apiNetModel: NetApiModel
    @ObservedObject var appModel: AppModel = AppModel()
    


    var body: some View {
        NavigationView {
            List {
                NavigationLink("请求监听", tag: "dio-apis", selection: $savedSelection, destination: { NetApiWindow() })
            }
            .frame(minWidth: 200)
            .listStyle(SidebarListStyle())
            Text("No sidebar item selected.")
        }
        .frame(width: 1000, height: 600)
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Button {
                    NSApp.sendAction(#selector(NSSplitViewController.toggleSidebar(_:)), to: nil, from: nil)
                } label: {
                    Image(systemName: "sidebar.left").help("Toggle sidebar")
                }
            }
        }.onAppear{
//            appModel.loadAllCategorys()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
