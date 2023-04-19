
import SwiftUI

struct ResultView: View {
    
    var result: Int
    
    var body: some View {
        ZStack{
            Color.white
            
            VStack(spacing: 100){
                
                Image(imagename())
                    .resizable()
                    .frame(width: 300, height: 300)
                    .scaledToFit()
                    .animation(.easeIn(duration: 2.0), value: true)
                
                Text(message())
                    .foregroundColor(Color(red:70/255, green: 43/255, blue:121/255))
                    .font(.system(size: 60))
                    .bold()
                
                NavigationLink(destination: ViewTwo()) {
                    Text("Try another note")
                        .foregroundColor(Color(red:70/255 , green: 43/255, blue:121/255))
                        .font(.system(size: 25))
                        .bold()
                        .frame(width: 250, height: 60)
                        .background(Color(red:182/255,green:202/255, blue:225/255))
                        .cornerRadius(20)
                }.navigationBarHidden(true)
            }
            
        }.ignoresSafeArea()
        
    }
    
    func imagename() -> String{
        var faceimage: String
        
        if(result == 0){
           faceimage = "happyFace"
        }else{
           faceimage = "sadFace"
        }
        
        return faceimage
    }
    
    func message() -> String{
        var message: String
        if(result == 0){
            message = "Correct answer"
        }else{
            message = "Incorrect answer"
        }
        
        return message
    }
}


struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(result: 0)
    }
}
