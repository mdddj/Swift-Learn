//
//  Image.swift
//  FlutterNet
//
//  Created by ldd on 2022/6/29.
//

import SwiftUI

struct ImageView: View {
    
    
    let prefs = NSImage(named: NSImage.preferencesGeneralName)!
    let user = NSImage(named: NSImage.userAccountsName)!
    let advanced = NSImage(named: NSImage.advancedName)!
    let computer = NSImage(named: NSImage.computerName)!
    let folder = NSImage(named: NSImage.folderName)!
    
    let caution = NSImage(named: NSImage.cautionName)!
    let group = NSImage(named: NSImage.userGroupName)!
    let guest = NSImage(named: NSImage.userGuestName)!
    let font = NSImage(named: NSImage.fontPanelName)!
    let info = NSImage(named: NSImage.infoName)!
    
    
    var body: some View {
        ScrollView {
            VStack {
                Image("avatar")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                
                VStack(spacing: 20){
                    Text("Images as SF Symbols")
                    Image(systemName: "trash")
                    Image(systemName: "trash.fill")
                    Image(systemName: "gear")
                        .font(.system(size: 32,weight: .bold))
                    Image(systemName: "gear")
                        .imageScale(.large)
                    Image(systemName: "paperplane.circle.fill")
                        .renderingMode(.original).font(.largeTitle)
                }
                
                
                HStack(spacing: 60){
                    VStack(spacing:20){
                        Image(nsImage: prefs)
                        Image(nsImage: user)
                        Image(nsImage: advanced)
                        Image(nsImage: computer)
                        Image(nsImage: folder)
                    }
                    VStack(spacing:20){
                        Image(nsImage: caution)
                        Image(nsImage: group)
                        Image(nsImage: guest)
                        Image(nsImage: font)
                        Image(nsImage: info)
                    }
                }
            }
        }
        .padding()
    }
}

struct Image_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
