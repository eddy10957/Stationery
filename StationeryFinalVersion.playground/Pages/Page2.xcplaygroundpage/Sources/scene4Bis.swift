import Foundation
import SwiftUI


public struct scene4Bis: View{
    @Binding var step: Int
    @State var introText = 1
    @State var animationCard = false
    @State var toggleAnimation = false
    @State var fadeInOut = false
    
    public init(_ step: Binding<Int>){
        self._step = step
    }
    
    public var body: some View{
        ZStack{
            Image(uiImage: UIImage(named: "background3.png")!)
                .resizable()
                .scaledToFill()
            Image(uiImage: UIImage(named: "stitler.png")!)
                .resizable()
                .scaledToFill()
            Image(uiImage: UIImage(named: "Stand.png")!)
                .resizable()
                .scaledToFill()
            if step == 5 {
                Image(uiImage: UIImage(named: "Mano.png")!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 400, height: 400)
                    .rotationEffect(Angle(degrees: -90))
                    .onAppear(){
                        withAnimation(Animation.easeInOut(duration: 0.5)
                                        .repeatCount(10)){
                            fadeInOut.toggle()
                        }
                    }.opacity(fadeInOut ? 0 : 1)
                    .offset(x:100,y:-160)
            }
            
            Image(uiImage: UIImage(named: "Mustachefull.png")!)
                .resizable()
                .scaledToFit()
                .frame(width: 102, height: 20)
                .offset(y:-156)
                .scaleEffect(toggleAnimation ? 0.96 : 1)
                .onTapGesture{
                    withAnimation(Animation.easeInOut(duration: 0.2).repeatForever()){
                        toggleAnimation.toggle()
                    }
                    playSounds("Angry2.mp3")
                }

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
