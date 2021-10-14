import SwiftUI

public struct controller: View {
    @State var step = 3
    @State private var fadeInOut = false
    
    public init() {}
    
    public var body: some View {
        if(step == 3) {
            scene3($step)
        }
        else if(step == 4){
            scene4($step)
        }
        else if(step == 5){
            scene5($step)
        }
        else{
            Text("Click on Next in Page2 to continue the story.")
                .onAppear(){
                    withAnimation(Animation.easeInOut(duration: 1)
                                    .repeatForever()){
                        fadeInOut.toggle()
                    }
                }.opacity(fadeInOut ? 0 : 1)
            
        }
    }
}

