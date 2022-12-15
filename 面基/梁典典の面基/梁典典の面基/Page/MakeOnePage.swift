//
//  MakeOnePage.swift
//  梁典典の面基 - 申请面基页面
//
//  Created by ldd on 2022/9/17.
//

import SwiftUI

struct MakeOnePage: View {
    @Environment(\.dismiss) var dismiss
    
    
    var ages = ["18-20岁","20-24岁","24-26岁","保密"]
    @State private var title: String = "喝酒"
    @State private var notes: String = "仅喝酒,到点回家"
    @State private var name: String = "梁典典"
    @State private var sName: String = "梁典典"
    @State private var location: String = "番禺区"
    @State private var toLocation: String = "番禺某某酒吧"
    @State private var timer: String = "周末下午5点"
    @State private var wechat:String = "flutter-null"
    @State private var age: String = "保密"
    
    
    var body: some View {
        NavigationView {
            
                Form {
                    Section(header: Text("面基信息")) {
                        TextField("面基安排事项", text:$title)
                        TextField("备注留言",text: $notes)
                    }
                    Section(header: Text("你的资料(仅典典可见,不会泄露给别人)")) {
                        TextField("名字",text: $name)
                        TextField("地区",text: $location)
                        TextField("微信号",text: $wechat)
                        TextField("Soul昵称",text: $sName)
                        Picker("年龄段", selection: $age) {
                            ForEach(ages,id: \.self){
                                Text("\($0)")
                            }
                        }
                    }
                    Section(header: Text("其他")) {
                        TextField("请填写面基地点",text: $toLocation)
                        TextField("面基时间,精确到小时",text: $timer)
                    }
                    Section("自拍(可选)") {
                        Button("上传") {
                            

                        }
                    }
                }
            
            .navigationTitle("申请和梁典典面基")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button("申请") {
                    var model = AddMianjiParams()
                    model.state = 0
                    model.aboutDiandian = title
                    model.location = location
                    model.age = ages.firstIndex(of: age) ??  -1
                    model.mianjiInfo = notes
                    model.soulName = sName
                    model.name = name
                    MyHttpUtil.request(API.addMianji(model:model)) { json in
                        print("添加数据成功\(json)")
                    } failure: { code, msg in
                        print("添加数据失败:\(code) \(msg)")
                    }
                }
            }
            .navigationBarItems(leading: Button("取消", action: {
                dismiss()
            }))
        }
    }
    

    ///上传照片
    func uploadPicture() {
        
    }
}

struct MakeOnePage_Previews: PreviewProvider {
    static var previews: some View {
        MakeOnePage()
    }
}
