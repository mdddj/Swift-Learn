


import SwiftUI

struct CircleImage : View {
    var body: some View {
        Image("b1")
            .frame(width: 160, height: 160)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white,lineWidth: 4))
            .shadow(radius: 10)
            .padding()
        
    }
}



struct CircleImage_Preview : PreviewProvider {
    static var previews : some View {
        CircleImage()
    }
}
