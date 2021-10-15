import Foundation
import SwiftUI


public struct scene5Bis: View{
    @Binding var step: Int
    @State var animationCard = false
    @State var fadeInOut = false
    @State var fadeInOut1 = false
    
    public init(_ step: Binding<Int>){
        self._step = step
    }
    
    public var body: some View{
        ZStack{
            Image(uiImage: UIImage(named: "Background5.png")!)
                .resizable()
                .scaledToFill()
            
            Image(uiImage: UIImage(named: "Mano.png")!)
                .resizable()
                .scaledToFit()
                .frame(width: 400, height: 400)
                .onAppear(){
                    withAnimation(Animation.easeInOut(duration: 0.5)
                                    .repeatCount(10)){
                        fadeInOut1.toggle()
                    }
                }.opacity(fadeInOut1 ? 0 : 1)
                .offset(y:-200)
            
            Image(uiImage: UIImage(named: "muzleFlash.png")!)
                .resizable()
                .scaledToFill()
                .onTapGesture {
                    withAnimation(Animation.easeInOut(duration: 0.3)
                                    .repeatForever()){
                        fadeInOut.toggle()
                    }
                    playSounds("gunshots.mp3")
                }.opacity(fadeInOut ? 0 : 1)
            
            Button(action: {
                step += 1
            }, label: {
                Image(uiImage: UIImage(named: "Triangle.png")!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
            })
                .offset(x:173,y:287)
        }
        .frame(width:490,height:700)
    }
}


