import SwiftUI

public struct controller: View {
    @State var step = 6
    @State private var fadeInOut = false
    
    public init() {}
    
    public var body: some View {
        if(step == 6) {
            scene6($step)
        }
        else if(step == 7){
            scene7($step)
        }
        else{
            Text("Click on Next in Page3 to continue the story.")
                .onAppear(){
                    withAnimation(Animation.easeInOut(duration: 1)
                                    .repeatForever()){
                        fadeInOut.toggle()
                    }
                }.opacity(fadeInOut ? 0 : 1)
            
        }
    }
}

