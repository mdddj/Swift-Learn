//
//  WebImage.swift
//  lean_swiftui_01
//
//  Created by ldd on 2021/12/31.
//
// 加载一张网络图片的学习


import SwiftUI

struct WebImage: View {
    
    @State private var imageUi:UIImage? = nil
    
    let placeHodel = UIImage(named: "swift")
    
    var body: some View {
        Image(uiImage: self.imageUi ?? placeHodel!).resizable()
            .aspectRatio(1, contentMode: .fit)
            .onAppear(perform: getNetImage)
    }
    
    
    // 创建一个方法，获取一张网络图片
    func getNetImage(){
        guard let imageUrl = URL(string: "https://i.imgur.com/kbYvbMt.jpeg") else { return }
        URLSession.shared.dataTask(with: imageUrl) { (data,response,error) in
            if let image = UIImage(data: data!) {
                self.imageUi = image
            }else{
                print("error\(String(describing: error))")
            }
        }.resume()
    }
}

struct WebImage_Previews: PreviewProvider {
    static var previews: some View {
        WebImage()
    }
}
