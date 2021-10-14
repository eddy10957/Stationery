import SwiftUI


public struct scene9: View{
    @Binding var step: Int
    @State var animationCard = false
    @State var page = 1
    @State private var bgOpacity = 1.0
    @State var xAxis = 0.0
    @State var fadeInOut = false
    
    public init(_ step: Binding<Int>){
        self._step = step
    }
    
    public var body: some View {
        ZStack{
            if(page == 1){
                ZStack{
                    Image(uiImage: UIImage(named: "Background.png")!)
                        .resizable()
                        .scaledToFill()
                    
                    Image(uiImage: UIImage(named: "ArmyMiddle.png")!)
                        .resizable()
                        .scaledToFill()
                        .offset(x: xAxis)
                    
                    Image(uiImage: UIImage(named: "ArmyDx.png")!)
                        .resizable()
                        .scaledToFill()
                        .offset(x: xAxis)
                    
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
                    
                    Image(uiImage: UIImage(named: "ArmySx.png")!)
                        .resizable()
                        .scaledToFill()
                        .offset(x: xAxis)
                        .onTapGesture {
                            withAnimation(Animation.easeInOut(duration: 3)){
                                xAxis = -600
                                playSounds("March2.mp3")
                                DispatchQueue.main.asyncAfter(deadline: .now() + 3){
                                    page += 1
                                }
                            }
                        }
                }
                .opacity(bgOpacity)
            }else{
                ZStack{
                    Image(uiImage: UIImage(named: "ToBeContinued1.png")!)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 490, height: 700)
                        .onAppear(perform:{
                            playSounds("directedby.mp3")
                        })
                }
            }
        }
        .frame(width: 490, height: 700)
        .background(Color.black)
    }
}
