
import SwiftUI
import AVKit

struct TestView: View {
    let notes: [String]
    let note: String
    @State var playNote = 0
    @State var playTest = false
    @State var player: AVAudioPlayer?
    @State var colorRectangule = Color(red:182/255,green:202/255, blue:225/255)
    @State var colorPlayTesticon = Color(red:70/255 , green: 43/255, blue:121/255)
    @State var correct : Int = 0
    @State var index1 : Int = 0
    @State var index2 : Int = 0
    @State var index3 : Int = 0
    @State var endTestSounds = false
    @State var faceResult = "sadFace"
    
    var body: some View {
        ZStack{
            Color(.white)
            
            Image(note.lowercased())
                .resizable()
                .scaledToFit()
                .frame(width: 900, height: 900)
                .opacity(0.05)
            VStack{
                Text("Listen to the note's real sound")
                    .bold()
                    .font(.system(size: 80))
                    .foregroundColor(Color(red:70/255 , green: 43/255, blue:121/255))
                    .padding(.bottom)
                
                Text("(Press the next button)")
                    .foregroundColor(Color(red:70/255, green: 43/255, blue:121/255))
                    .font(.system(size: 30))
                
                ZStack{
                    Rectangle()
                        .scaledToFit()
                        .frame(width: 250, height: 250)
                        .foregroundColor(colorRectangule)
                        .cornerRadius(30)
                    
                    Image("soundWave")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                    
                }.onTapGesture {
                    colorRectangule = Color(red:230/255,green:230/255, blue:230/255)
                    while(playNote == 0){
                        self.playsoundNote()
                        playNote = 1
                    }
                }
                
                Text("Now you're going to hear three different sounds, and you'll choose which one is correct.")
                    .foregroundColor(Color(red:70/255, green: 43/255, blue:121/255))
                    .font(.system(size: 30))
                    .frame(width: 700, height: 100)
                
                ZStack{
                    Circle()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .foregroundColor(colorPlayTesticon)
                        .cornerRadius(30)
                    
                    Image(systemName: "play.fill")
                        .resizable()
                        .frame(width: 28 ,height: 35)
                        .foregroundColor(.white)
                        .padding(.leading, 7)
                    
                }.onTapGesture {
                    if playTest == false && playNote == 1 {
                        self.iterationIndexSounds(Selectednote: note)
                        playTest = true
                        colorPlayTesticon = Color(red:200/255 , green: 191/255, blue:216/255)
                    }
                }
                .padding(.bottom, 30)
                
                
                HStack(spacing: 40){
                    
                    NavigationLink(destination: ResultView(result: index1), label: {
                        
                        Text("1st sound")
                           .foregroundColor(Color(red:70/255 , green: 43/255, blue:121/255))
                           .font(.system(size: 25))
                           .bold()
                           .frame(width: 135, height: 60)
                           .background(Color(red:182/255,green:202/255, blue:225/255))
                           .cornerRadius(20)
                    })
                    .disabled(!endTestSounds)
                  
                    
                    
                    NavigationLink(destination: ResultView(result: index2), label: {
                        Text("2nd sound")
                            .foregroundColor(Color(red:70/255 , green: 43/255, blue:121/255))
                            .font(.system(size: 25))
                            .bold()
                            .frame(width: 137, height: 60)
                            .background(Color(red:182/255,green:202/255, blue:225/255))
                            .cornerRadius(20)
                    }).disabled(!endTestSounds)
                    
                    NavigationLink(destination: ResultView(result: index3), label: {
                        Text("3rd sound")
                            .foregroundColor(Color(red:70/255 , green: 43/255, blue:121/255))
                            .font(.system(size: 25))
                            .bold()
                            .frame(width: 135, height: 60)
                            .background(Color(red:182/255,green:202/255, blue:225/255))
                            .cornerRadius(20)
                    }).disabled(!endTestSounds)
                }
            }
        }.ignoresSafeArea()
    }
    
    func playsoundNote() {
        if let audioURL = Bundle.main.url(forResource: note, withExtension: "mp3") {
            do {
                try self.player = AVAudioPlayer(contentsOf: audioURL)
                self.player?.play()
                
            } catch {
                print("Couldn't play audio. Error: \(error)")
            }
            
        } else {
            print("No audio file found")
        }
    }
    
    func iterationIndexSounds(Selectednote: String){
        let SNindex: Int = notes.firstIndex(of: Selectednote) ?? 0
        var Index2R: Int
        var Index3R: Int
        
        repeat{
            Index2R = Int.random(in: 0...6)
            Index3R = Int.random(in: 0...6)
        }while(Index2R == Index3R || SNindex == Index3R || SNindex == Index2R)
        
        //New index's array
        let SortedIndices = [SNindex, Index2R, Index3R ]
        //Variables to iterate through the array of indices -> SortedIndices
        var count = 3
        
        
        repeat{
            if(count == 3){
                index1 = Int.random(in: 0...2)
                //Play sound of notes[SortedIndices[index1]]
                if let audioURL1 = Bundle.main.url(forResource: notes[SortedIndices[index1]], withExtension: "mp3") {
                    do {
                        try self.player = AVAudioPlayer(contentsOf: audioURL1)
                        self.player?.play()                    } catch {
                            print("Couldn't play audio 1. Error: \(error)")
                        }
                    
                }
                
                if(SortedIndices[index1] == SortedIndices[0]){
                    correct = index1
                }
                
                count-=1
                sleep(1)
            }else if(count == 2){
                repeat{
                    index2 = Int.random(in: 0...2)
                }while(index2 == index1)
                //Play sound of notes[SortedIndices[index1]]
                if let audioURL2 = Bundle.main.url(forResource: notes[SortedIndices[index2]], withExtension: "mp3") {
                    do {
                        try self.player = AVAudioPlayer(contentsOf: audioURL2)
                        self.player?.play()
                    } catch {
                        print("Couldn't play audio 2. Error: \(error)")
                    }
                    
                }
                
                if(SortedIndices[index2] == SortedIndices[0]){
                    correct = index2
                }
                
                count = count - 1
                sleep(1)
            }else if(count == 1){
                repeat{
                    index3 = Int.random(in: 0...2)
                }while(index3 == index1 || index3 == index2)
                //Play sound of notes[SortedIndices[index1]]
                if let audioURL3 = Bundle.main.url(forResource: notes[SortedIndices[index3]], withExtension: "mp3") {
                    do {
                        try self.player = AVAudioPlayer(contentsOf: audioURL3)
                        self.player?.play()
                    } catch {
                        print("Couldn't play audio 3. Error: \(error)")
                    }
                    
                }
                
                if(SortedIndices[index3] == SortedIndices[0]){
                    correct = index3
                }
                count = count - 1
                endTestSounds = true
            }
        }while count > 0
    }
    
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView(notes: ["","","","","","",""], note: "")
    }
}
