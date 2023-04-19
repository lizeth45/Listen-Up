
import SwiftUI

struct PopUp: View {
    @Binding var showPopUp: Bool
    
    var body: some View {

        ZStack{
            LinearGradient(colors: [(Color(red: 80/255, green: 55/255, blue: 200/255)),(Color(red: 223/255, green: 208/255, blue: 185/255))], startPoint: .topLeading, endPoint: .center)
           
                VStack{
                    HStack{
                        Image(systemName: "clear.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color(red:70/255 , green: 13/255, blue:121/255))
                            .padding(.trailing,610)
                            .padding(.top,30)
                            .onTapGesture {
                                showPopUp.toggle()
                            }
                    }

                    Image("hearphones")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                    
                    
                    Text("Welcome to Listen Up, the perfect application for those who want to improve their absolute pitch! Listen Up offers a test of 7 sounds, each one belonging to a different note of the C major scale. Are you ready to put your listening skills to the test and familiarize yourself with each of the notes?")
                        .frame(width: 700, height: 500)
                        .lineSpacing(10)
                        .foregroundColor(Color(red:70/255 , green: 43/255, blue:121/255))
                        .font(.system(size: 35))
                        .multilineTextAlignment(.center)
                        .scaledToFit()
                    
                }.padding(.leading, 5)
                    .padding(.trailing, 5)
        }.ignoresSafeArea()
    }
}

struct PopUp_Previews: PreviewProvider {
    static var previews: some View {
        PopUp(showPopUp: .constant(false))
    }
}
