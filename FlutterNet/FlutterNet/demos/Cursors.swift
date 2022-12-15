//
//  Cursors.swift
//  FlutterNet
//
//  Created by ldd on 2022/6/28.
//

import SwiftUI

//光标样式
struct Cursors: View {
    var body: some View {
        VStack(spacing: 20){
            Text("将鼠标悬停在每个按钮上以更改光标。")
            
            Button("工字光标"){}
                .onHover { hovering in
                    hovering ? NSCursor.iBeam.push() : NSCursor.pop()
                }
            
            Button("十字光标"){}
                .onHover { hovering in
                    hovering ? NSCursor.crosshair.push() : NSCursor.pop()
                }
            
            Button("closedHand光标"){}
                .onHover { hovering in
                    hovering ? NSCursor.closedHand.push() : NSCursor.pop()
                }
            
            Button("open-hand光标"){}
                .onHover { hovering in
                    hovering ? NSCursor.openHand.push() : NSCursor.pop()
                }
            
            Button("pointing-hand光标"){}
                .onHover { hovering in
                    hovering ? NSCursor.pointingHand.push() : NSCursor.pop()
                }
        }
    }
}

struct Cursors_Previews: PreviewProvider {
    static var previews: some View {
        Cursors()
    }
}
