import SwiftUI


public struct scene6: View{
    @Binding var step: Int
    @State var animationCard = false
    
    public init(_ step: Binding<Int>){
        self._step = step
    }
    
    public var body: some View{
        ZStack{
            Image(uiImage: UIImage(named: "scena6.png")!)
                .resizable()
                .scaledToFill()
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
                    Text("Reporter:")
                        .font(.subheadline)
                        .bold()
                    Text("The protest ended today. Rubbers are leaving the city because, to quote them, there is no place for erasers in a world with no pencils")
                        .foregroundColor(Color.black)
                        .frame(width: 380).onAppear(perform:{
                            playSounds("voice2.mp3")
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
