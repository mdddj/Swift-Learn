//
//  LandmarkRow.swift
//  swift_ui_test1
//
//  Created by ldd on 2021/11/5.
//

import SwiftUI

struct LandmarkRow: View {
    
    
    var landmark : Landmark
    
    var body: some View {
        Text("test")
        
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkRow(landmark: landmarks[0])
    }
}
