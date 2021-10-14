import SwiftUI

public struct controller: View {
    @State var step = 8
    @State private var fadeInOut = false
    
    public init() {}
    
    public var body: some View {
        if(step == 8) {
            scene8($step)
        }
        else if(step == 9){
            scene9($step)
        }
        else{
            Text("The End")
                .onAppear(){
                    withAnimation(Animation.easeInOut(duration: 1)
                                    .repeatForever()){
                        fadeInOut.toggle()
                    }
                }.opacity(fadeInOut ? 0 : 1)
            
        }
    }
}

