import SwiftUI


public struct scene5: View{
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
        
        ZStack{
            
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                .offset(y:250)
            
            RoundedRectangle(cornerRadius: 20)
                .strokeBorder(LinearGradient(
                    gradient: Gradient(stops: [
                        .init(color: Color(#colorLiteral(red: 1, green: 0.2339373911, blue: 0, alpha: 1)), location: 0),
                        .init(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), location: 1)]),
                    startPoint: UnitPoint(x: 0.5, y: -0.03),
                    endPoint: UnitPoint(x: 0.5, y: 1)), lineWidth: 3)
                .offset(y:250)
            
            VStack{
                Text("Narrator:")
                    .font(.subheadline)
                    .bold()
                Text("The extermination of all pencils was an unavoidable consequence")
                    .foregroundColor(Color.black)
                    .frame(width: 380)
                    .onAppear(perform:{
                        playSounds("voice1.mp3")
                    })
            }
            .offset(y:250)
            
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
        .frame(width: animationCard ? 400 : 2, height: animationCard ? 104.64 : 2)
        .animation(.interactiveSpring(response: 1, dampingFraction: 1, blendDuration: 10))
        .onAppear {
            animationCard = true
        }
    }
        .frame(width:490,height:700)
}
}
