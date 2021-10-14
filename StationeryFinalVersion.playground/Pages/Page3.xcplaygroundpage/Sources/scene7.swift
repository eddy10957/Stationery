import SwiftUI


public struct scene7: View{
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
                    }
                }
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
                    Text("Pens finally reached the model society they always dreamt about, partying for days.")
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
