//
//  LoginView.swift
//  mianjizhushou
//
//  Created by ldd on 2022/2/9.
//

import Alamofire
import SwiftUI
import SwiftyJSON

struct LoginParamModel: Encodable {
    var loginNumber: String
    var password: String
}

struct LoginView: View {
    @State var showAlert: Bool = false
    @State var alertText: String = ""
    @State var username: String = "admin"
    @State var password: String = "123456"
    @State var loginSuccess: Bool = false
    @State var userToken: String = ""
    var body: some View {
        Form {
            Section {
                TextField("用户名", text: $username)
                SecureField("密码", text: $password)
            }
            Section {
                Button(loginSuccess ? "登录成功" : "登录") {
                    login()
                }
            }
        }.alert(isPresented: $showAlert, content: {
            SingleDialog("\(alertText)") {
                self.showAlert = false
            }
        })
    }

    func login() {
        let model = LoginParamModel(loginNumber: username, password: password)
        AF.request("\(IP)/api/user/login",
                   method: .post,
                   parameters: model,
                   encoder: JSONParameterEncoder.default
        ).responseData { response in
            switch response.result {
            case .success:
                let data = try! JSON(data: response.data!)
                print(data)
                let state = data["state"].intValue
                let msg = data["message"].stringValue
                if state == 200 {
                    print("登录成功")
                    let token = data["data"].stringValue
                    print("用户TOKEN: \(token)")
                    self.userToken = token
                    UserDefaults.standard.set(token, forKey: "user_token")
                } else {
                    print("登录不成功.")
                    showAlertDialog(msg: msg)
                }
            case let .failure(error):
                showAlertDialog(msg: "\(String(describing: error.errorDescription) ?? "请求失败")")
            }
        }
    }
    
    func showAlertDialog(msg:String) {
        self.showAlert = true
        self.alertText = msg
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

// 5+9=14 14
