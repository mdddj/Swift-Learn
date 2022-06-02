//
//  CustomTabBar.swift
//  SwiftDemo2
//
//  Created by ldd on 2022/5/25.
//

import SwiftUI

struct CustomTabBar: View {
    
    @Binding var currentTab: Tab
    @State var yOffset : CGFloat = 0
    
    var body: some View {
        GeometryReader { proxy in
            let width = proxy.size.width
            HStack(spacing: 0) {
                ForEach(Tab.allCases,id: \.rawValue) { tab in
                    Button {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            currentTab = tab
                            yOffset = -60
                        }
                        withAnimation(.easeInOut(duration: 0.1).delay(0.07)) {
                            yOffset = 0
                        }
                    } label: {
                        Image(systemName: tab.rawValue)
                            .renderingMode(.template)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(currentTab == tab ? .purple : .gray)
                            .scaleEffect(currentTab == tab && yOffset != 0 ? 1.5 : 1 )
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .background(alignment: .leading) {
                Circle()
                    .fill(.yellow)
                    .frame(width: 25, height: 25)
                    .offset(x: 10,y: yOffset)
                    .offset(x: indicatorOffset(width: width))
            }
        }
        .frame(height: 30)
        .padding(.bottom,10)
        .padding([.horizontal,.top])
    }
    
    func indicatorOffset(width: CGFloat) -> CGFloat {
        let index = CGFloat(getIndex())
        if index == 0 {return 0}
        let buttonWidth = width / CGFloat(Tab.allCases.count)
        return index * buttonWidth
    }
    
    func getIndex() -> Int {
        switch currentTab {
        case .home:
            return 0
        case .search:
            return 3
        case .me:
            return 4
        case .message:
            return 1
        case .write:
            return 2
        }
    }
}

