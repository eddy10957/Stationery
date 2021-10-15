import Foundation
import SwiftUI


public struct scene7Bis: View{
    @Binding var step: Int
    @State var animationCard = false
    @State var toggleAnimationX = false
    @State var fadeInOut = false
    
    public init(_ step: Binding<Int>){
        self._step = step
    }
    
    public var body: some View{
        ZStack{
            Image(uiImage: UIImage(named: "Background.png")!)
                .resizable()
                .scaledToFill()
            Image(uiImage: UIImage(named: "GlassDx.png")!)
                .resizable()
                .scaledToFill()
                .offset(x: toggleAnimationX ? -10:0)
            
            Image(uiImage: UIImage(named: "Mano.png")!)
                .resizable()
                .scaledToFit()
                .frame(width: 400, height: 400)
                .onAppear(){
                    withAnimation(Animation.easeInOut(duration: 0.5)
                                    .repeatCount(10)){
                        fadeInOut.toggle()
                    }
                }.opacity(fadeInOut ? 0 : 1)
                .offset(y:-200)
            
            Image(uiImage: UIImage(named: "GlassSx.png")!)
                .resizable()
                .scaledToFill()
                .offset(x: toggleAnimationX ? 10:0)
                .onTapGesture {
                    withAnimation(Animation.easeInOut(duration: 0.4)
                                    .repeatForever()){
                        toggleAnimationX.toggle()
                        playSounds("Toast.mp3")
                    }
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
