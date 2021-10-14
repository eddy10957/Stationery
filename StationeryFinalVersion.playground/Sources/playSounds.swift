import SwiftUI
import AVFoundation

var audioPlayer: AVAudioPlayer!

public func playSounds(_ soundFileName : String) {
    guard let soundURL = Bundle.main.url(forResource: soundFileName, withExtension: nil) else {
        fatalError("Unable to find \(soundFileName) in bundle")
    }
    
    do {
        audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
    } catch {
        print(error.localizedDescription)
    }
    audioPlayer.play()
}
