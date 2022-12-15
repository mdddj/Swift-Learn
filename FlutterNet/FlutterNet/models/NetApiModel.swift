import Combine
import Foundation
import Kodable
import SwiftyJSON
/**
 存放全局的api接口
 */
class NetApiModel: ObservableObject {
    
    static let sharedInstance = NetApiModel()
    
    @Published var apis = [String: [RequestModel]]()

    /// 当前显示的项目列表
    @Published var currentSelectProject: String? = nil

    /// 接收到api请求
    func addNewApi(json: String) {
        if let j = json.data(using: .utf8) {
            do {
                let originData = try JSON(data: j)
                _ = originData["type"].stringValue
                let jsonValueString = originData["jsonString"].stringValue
                
                if let jsonValueData = jsonValueString.data(using: .utf8) {
                    
                    let jsonValue = try JSON(data: jsonValueData)
                    
                    let projectName = jsonValue["projectName"].stringValue
                    
                    
                    ///转换模型
                     let model = try JSONDecoder().decode(RequestModel.self, from: jsonValueData)
                    
                    
                    print("数据类型>>:\(model.url) >>> 项目名:\(projectName)")
                    let projects = apis.keys
                    if projects.contains(projectName) {
                        // 如果存在
                        let arr = apis[projectName]
                        if var arr = arr {
                            arr.append(model)
                            apis[projectName] = arr
                        }
                    }else{
                        // 如果不存在
                        apis[projectName] = [model]
                    }
                    
                    ///打印一下
                    print(">>>>>>\(apis.count)  >>> ")
                    if currentSelectProject == nil {
                        currentSelectProject = projectName
                    }
                }
            } catch {
                print("添加接口出现错误\(error)")
            }
        }
    }
}

/// 接口请求模型
struct RequestModel: Kodable,Identifiable {
    var id: String {
        return UUID().uuidString
    }
    @Coding("url") var url: String
    @Coding("methed") var methed: String
    @Coding("statusCode") var statusCode: Int
    @Coding("timesatamp") var timesatamp: Int
    @Coding("projectName") var projectName: String
}
