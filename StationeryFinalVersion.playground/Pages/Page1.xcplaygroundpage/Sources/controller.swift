import SwiftUI

public struct controller: View {
    @State var step = 0
    @State private var fadeInOut = false
    
    public init() {}
    
    public var body: some View {
        if(step == 0) {
            intro($step)
        }
        else if(step == 1){
            scene1($step)
        }
        else if(step == 2){
            scene2($step)
        }
        else if(step == 3){
            scene2Bis($step)
        }
        else{
            Text("Click on Next in Page1 to continue the story.")
                .onAppear(){
                    withAnimation(Animation.easeInOut(duration: 1)
                                    .repeatForever()){
                        fadeInOut.toggle()
                    }
                }.opacity(fadeInOut ? 0 : 1)
            
        }
    }
}

