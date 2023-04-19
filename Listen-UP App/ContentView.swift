import SwiftUI

struct ContentView: View {
    
    @State var showPopUp: Bool = false
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                LinearGradient(colors: [(Color(red: 80/255, green: 55/255, blue: 200/255)),(Color(red: 223/255, green: 208/255, blue: 185/255))], startPoint: .topLeading, endPoint: .bottom)
                VStack{
                    Spacer()
                    HStack{
                        Image("note3")
                            .resizable()
                            .scaledToFit()
                            .opacity(0.2)
                            .frame(width: 260, height: 250)
                            .rotationEffect(Angle(degrees: 10))
                        
                    }.padding(.trailing, 550)
                    HStack{
                        Image("note1")
                            .resizable()
                            .scaledToFit()
                            .opacity(0.1)
                            .frame(width: 260, height: 250)
                            .rotationEffect(Angle(degrees: -5))
                        
                    }.padding(.leading, 350)
                    HStack{
                        Image("note2")
                            .resizable()
                            .scaledToFit()
                            .opacity(0.1)
                            .frame(width: 150, height: 300)
                            .rotationEffect(Angle(degrees: -10))
                        
                    }.padding(.trailing,600)
                    HStack{
                        Image("note3")
                            .resizable()
                            .scaledToFit()
                            .opacity(0.1)
                            .frame(width: 90, height: 190)
                            .rotationEffect(Angle(degrees: 55))
                    }.padding(.leading,500)
                }
                VStack{
                    ZStack{
                        Image("girl")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height:350)

                        Image("circleWhite")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 450, height: 450)
                            .shadow(color: .white, radius: 20)
                    }
                    
                    Text("Listen Up")
                        .foregroundColor(.white)
                        .bold()
                        .font(.custom("Futura", size: 70))
                        .padding()
                    
                    
                    NavigationLink(destination: ViewTwo(), label: {
                            Text("START")
                                .foregroundColor(.white)
                                .font(.system(size: 25))
                                .bold()
                                .frame(width: 130, height: 60)
                                .background(Color(red:70/255,green:43/255, blue:121/255))
                                .cornerRadius(20)
                                .padding()
                    })
                    
                    HStack{
                        Text("About")
                            .bold()
                            .font(.system(size: 25))
                            .foregroundColor(Color(red:70/255 , green: 43/255, blue:121/255))
                        
                       
                        Image(systemName: "questionmark.circle")
                            .resizable()
                            .foregroundColor(Color(red:70/255 , green: 43/255, blue:121/255))
                            .frame(width: 22, height: 22)
                    }.padding(.all)
                        .onTapGesture {
                            showPopUp.toggle()
                        }
                }
                
                if showPopUp {
                    withAnimation(.linear){
                        PopUp(showPopUp: $showPopUp)
                                .cornerRadius(30)
                                .transition(.move(edge: .bottom))
                                .frame(width: 600, height: 750)
                                .shadow(radius: 500)
                                
                    }
                }
            }.ignoresSafeArea()
        }.navigationViewStyle(StackNavigationViewStyle())
           
        
    }
}
