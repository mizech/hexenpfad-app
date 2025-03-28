import AVFAudio
import SwiftUI

struct HighlightDetailsView: View {
    var highlight: Highlight
    
    @State var audioPlayer: AVAudioPlayer?
    @State var playerState = PlayerState.paused
    
    var body: some View {
         ScrollView {
            VStack(spacing: 12) {
                Text(highlight.title)
                    .font(.title)
                Text(highlight.desc)
                Button {
                    if let audioFile = Bundle.main.path(forResource: highlight.audioFile, ofType: "mp3") {
                        do {
                            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioFile))
                        } catch {
                            print(error)
                        }
                        if let audioPlayer = audioPlayer {
                            switch playerState {
                                case .playing:
                                    audioPlayer.pause()
                                    playerState = PlayerState.paused
                                case .paused:
                                    audioPlayer.play()
                                    playerState = PlayerState.playing
                            }
                        }
                    }
                } label: {
                    Label(playerState.getCaption, systemImage: playerState.getSysImg)
                        .font(.title)
                }
                ForEach(highlight.image, id: \.self) { img in
                    Image(img)
                        .resizable()
                        .scaledToFit()
                }
            }
            .padding()
        }
     }
}

#Preview {
    HighlightDetailsView(
        highlight: Highlight(
            title: "Title of Highlight",
            desc: "Description-Text",
            number: 2,
            audioFile: "",
            image: [""]
        )
    )
}
