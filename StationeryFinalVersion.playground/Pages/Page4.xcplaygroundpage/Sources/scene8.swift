import SwiftUI

public struct scene8: View {
    @Binding var step: Int
    
    @State private var fadeInOut = false
    @State private var animationCard = false
    
    public init(_ step: Binding<Int>){
        self._step = step
    }
    
    public var body: some View{
        ZStack{
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                
                RoundedRectangle(cornerRadius: 20)
                    .strokeBorder(LinearGradient(
                        gradient: Gradient(stops: [
                            .init(color: Color(#colorLiteral(red: 1, green: 0.2339373911, blue: 0, alpha: 1)), location: 0),
                            .init(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), location: 1)]),
                        startPoint: UnitPoint(x: 0.5, y: -0.03),
                        endPoint: UnitPoint(x: 0.5, y: 1)), lineWidth: 3)
                VStack{
                    Text("Narrator:")
                        .font(.subheadline)
                        .bold()
                    Text("What they didn’t think is that their joy was suddenly coming to an end...")
                        .foregroundColor(Color.black)
                        .onAppear(perform:{
                            playSounds("voice2.mp3")
                        })
                }
                Button(action: {
                    step += 1
                }, label: {
                    Image(uiImage: UIImage(named: "Triangle.png")!)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                })
                    .offset(x:152,y:80)
            }
            .frame(width: animationCard ? 375 : 2, height: animationCard ? 204.64 : 2)
            .animation(.interactiveSpring(response: 1, dampingFraction: 1, blendDuration: 10))
            .onAppear {
                animationCard = true
            }
        }
        .frame(width: 490, height: 700)
        .background(Color.black)
    }
}
