//
//  HomeList.swift
//  梁典典の面基
//
//  Created by ldd on 2022/9/17.
//

import SwiftUI

struct HomeList: View {
    @State var isShowMakeView = false
    var body: some View {
        NavigationView {
            ScrollView{
                
            }
            .navigationTitle("梁典典の面基")
            .toolbar {
                Button("申请面基") {
                    self.isShowMakeView = true
                }.sheet(isPresented: $isShowMakeView) {
                    MakeOnePage()
                }
            }
        }
        
    }
}

struct HomeList_Previews: PreviewProvider {
    static var previews: some View {
        HomeList()
    }
}
