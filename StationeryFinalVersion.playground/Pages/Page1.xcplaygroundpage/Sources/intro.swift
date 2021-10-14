import SwiftUI



public struct intro: View {
    @Binding var step: Int
    
    @State var buttonOpacity = 0.0
    @State var page = 1
    @State private var fadeInOut = false
    @State private var animationCard = false
    
    public init(_ step: Binding<Int>){
        self._step = step
    }
    
    public var body: some View{
        ZStack{
            if(page == 1){
                VStack{
                    Text("Stationery")
                        .font(.custom("East Coast Stationery", size: 80))
                        .foregroundColor(.red)
                        .frame(width: 600, height: 100)
                        .scaledToFit()
                        .padding(150)
                    
                    Button(action: {
                        page = 2
                    }, label: {
                        Text("Tap to Start")
                            .foregroundColor(Color.white)
                            .onAppear(){
                                withAnimation(Animation.easeInOut(duration: 1)
                                                .repeatForever()){
                                    fadeInOut.toggle()
                                }
                            }.opacity(fadeInOut ? 0 : 1)
                    })
                }
            }
            if(page == 2){
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
                            Text("Once upon a time, in the city of Stationery, a news broke the equilibrium of everyone’s life")
                                .foregroundColor(Color.black)
                                .onAppear(perform:{
                                    playSounds("voice1.mp3")
                                })
                        }
                    
                    Button(action: {
                        step += 1
                    }, label: {
                        Image(uiImage: UIImage(named: "Triangle.png")!)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .opacity(buttonOpacity)
                            .onAppear(){
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                                    buttonOpacity = 1.0
                                }
                            }
                    })
                        .offset(x:152,y:80)
                }
                .frame(width: animationCard ? 375 : 2, height: animationCard ? 204.64 : 2)
                .animation(.interactiveSpring(response: 1, dampingFraction: 1, blendDuration: 10))
                .onAppear {
                    animationCard = true
                }
            }
        }
        .frame(width: 490, height: 700)
        .background(Color.black)
    }
}
