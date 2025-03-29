import Foundation

enum PlayerState {
    case playing
    case paused
    
    var getCaption: String {
        switch self {
            case .playing:
                return "Pause"
            case .paused:
                return "Abspielen"
        }
    }
    
    var getSysImg: String {
        switch self {
            case .playing:
                return "pause.circle"
            case .paused:
                return "play.circle"
        }
    }
}
