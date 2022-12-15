//
//  NetApiWindow.swift
//  FlutterNet
//
//  Created by ldd on 2022/9/8.
//

import SwiftUI

extension RequestModel {
    var statesCodeColor: Color {
        if(self.statusCode == 200) {
            return Color.green
        }
        return Color.red
    }
}

struct NetApiWindow: View {
    @ObservedObject var netApiModel: NetApiModel = NetApiModel.sharedInstance
    @State var selected : String? = nil

    var apis: [RequestModel] {
        var apis = [RequestModel]()
        if let currentProject = netApiModel.currentSelectProject {
            apis = netApiModel.apis[currentProject] ?? [RequestModel]()
        }
        print("获取到接口请求数量:\(apis.count)")
        return apis
    }

    var body: some View {
        VStack {
            Table(apis, selection: $selected) {
                TableColumn("方法", value: \.methed).width(max: 80)
                TableColumn("状态码"){item in
                    Text(String(item.statusCode)).foregroundColor(item.statesCodeColor)
                }.width(max: 80)
                TableColumn("耗时") { item in
                    Text(String(item.timesatamp))
                }.width(max: 80)
                TableColumn("URL", value: \.url)
            }
        }
    }
}

struct NetApiWindow_Previews: PreviewProvider {
    static var previews: some View {
        NetApiWindow()
    }
}
