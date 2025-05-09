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
                } label: {
                    Label(
                        playerState.getCaption,
                        systemImage: playerState.getSysImg
                    )
                    .font(.title)
                    .frame(height: 46)
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                ForEach(highlight.image, id: \.self) { img in
                    Image(img)
                        .resizable()
                        .scaledToFit()
                }
            }
            .padding()
        }.onAppear() {
            if let audioFile = Bundle.main.path(forResource: highlight.audioFile, ofType: "mp3") {
                do {
                    audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioFile))
                } catch {
                    print(error)
                }
            }
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
