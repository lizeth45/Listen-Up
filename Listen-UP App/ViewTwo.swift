
import SwiftUI

struct ViewTwo: View {
    @State var isMainPresented = false
    
    let notes = ["C", "D", "E", "F", "G", "A", "B"]
    
    var body: some View {
        NavigationView{
            ZStack{
                LinearGradient(colors: [(Color(red: 123/255, green: 55/255, blue: 200/255)),(Color(red: 187/255, green: 222/255, blue: 237/255))], startPoint: .topLeading, endPoint: .bottomLeading)
                
                ScrollView(.vertical, showsIndicators: false){
                    ZStack{
                        Image(systemName: "house.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40)
                            .foregroundColor(.white)
                            .position(x:UIScreen.main.bounds.width * 0.055, y: UIScreen.main.bounds.height * 0.088)
                            .onTapGesture {
                                self.isMainPresented = true
                            }
                        VStack{
                            Spacer(minLength: 35)
                            Text("C major scale")
                                .font(.custom("FUTURA", size: 70))
                                .foregroundColor(.white)
                                .bold()
                                .padding(.horizontal)
                            
                            Spacer(minLength: 25)
                            
                            Text("Click on the note you wish to practice. First you will hear the actual sound of the note, and then you will be tested")
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                                .font(.system(size: 35))
                                .padding(.horizontal)
                            Spacer(minLength: 30)
                            
                            ForEach(notes.indices, id:\.self) { i in
                                NavigationLink(destination: TestView(notes: notes, note: notes[i])){
                                    ZStack{
                                        
                                        Circle()
                                            .foregroundColor(Color(red: 70/255, green: 43/255, blue: 121/255))
                                            .frame(width: 220, height: 220, alignment: .center)
                                            .shadow(color: .purple, radius:25)
                                        Text(notes[i])
                                            .bold()
                                            .font(.system(size: 60))
                                            .foregroundColor(.white)
                                    }
                                }
                            }
                        }
                    }
                }
                
                ContentView()
                    .offset(x: isMainPresented ? 0 : UIScreen.main.bounds.width + 500)
            }.ignoresSafeArea()
            
        }.navigationViewStyle(StackNavigationViewStyle())
            .navigationBarHidden(true)
            .accentColor(Color(red:70/255 , green: 43/255, blue:121/255))
    }
}

struct ViewTwo_Previews: PreviewProvider {
    static var previews: some View {
        ViewTwo()
    }
}
