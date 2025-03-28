import SwiftData
import Foundation

@Model
class Highlight: Hashable {
    var title: String
    var desc: String
    var number: Int
    var audioFile: String
    var image: [String]
    
    init(
        title: String,
        desc: String,
        number: Int,
        audioFile: String,
        image: [String]
    ) {
        self.title = title
        self.desc = desc
        self.number = number
        self.audioFile = audioFile
        self.image = image
    }
}
