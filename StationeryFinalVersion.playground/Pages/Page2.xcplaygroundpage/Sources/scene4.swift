import SwiftUI


public struct scene4: View{
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
                
                if(introText == 1){
                    VStack{
                        Text("Stitler:")
                            .font(.subheadline)
                            .bold()
                        Text("What is happening right now is a disaster for democracy and economy.")
                            .foregroundColor(Color.black)
                            .frame(width: 380)
                            .onAppear(perform:{
                                playSounds("voice1LOW.mp3")
                            })
                    }
                    .offset(y:250)
                }else if(introText == 2){
                    VStack{
                        Text("Stitler:")
                            .font(.subheadline)
                            .bold()
                        Text("Pencils are just rioters trying to throw our country into chaos.")
                            .foregroundColor(Color.black)
                            .frame(width: 380)
                            .onAppear(perform:{
                                playSounds("voice2LOW.mp3")
                            })
                    }
                    .offset(y:250)
                }else if(introText == 3){
                    VStack{
                        Text("Stitler:")
                            .font(.subheadline)
                            .bold()
                        Text("We won’t tolerate this any longer and neither should you. Our society is build on strong values and order.")
                            .foregroundColor(Color.black)
                            .frame(width: 380)
                            .onAppear(perform:{
                                playSounds("voice1LOW.mp3")
                            })
                    }
                    .offset(y:250)
                }else{
                    VStack{
                        Text("Stitler:")
                            .font(.subheadline)
                            .bold()
                        Text("What pencils are trying to do is disgraceful, so we should act to maintain the world that we made for ourselves, together.")
                            .foregroundColor(Color.black)
                            .frame(width: 380)
                            .onAppear(perform:{
                                playSounds("voice2LOW.mp3")
                            })
                    }
                    .offset(y:250)
                }
                
                Button(action: {
                    if(introText < 4){
                        introText += 1
                    }
                    else{
                        step += 1
                    }
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
