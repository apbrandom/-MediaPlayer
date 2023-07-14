//
//  ViewController.swift
//  AVFoundation_Audio
//
//  Created by Vadim Vinogradov on 14.07.2023
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player = AVAudioPlayer()
    var trackNames = Track.make()
    var currentTrackIndex = 0
    
    @IBOutlet weak var playPauseButtonImage: UIButton!
    
    @IBOutlet weak var stopButtonImage: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadTrack(trackName: trackNames[currentTrackIndex])
    }
    
    func loadTrack(trackName: String) {
        do {
            player = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: trackName, ofType: "mp3")!))
            player.prepareToPlay()
        }
        catch {
            print(error)
        }
    }

    @IBAction func PlayButton(_ sender: Any) {
        if player.isPlaying {
            player.pause()
            playPauseButtonImage.setImage(UIImage(systemName: "play.fill"), for: .normal)
        } else {
            player.play()
            playPauseButtonImage.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        }
    }
    
    @IBAction func StopButton(_ sender: Any) {
        if player.isPlaying {
            player.stop()
            player.currentTime = 0
            playPauseButtonImage.setImage(UIImage(systemName: "play.fill"), for: .normal)
        }
        else {
            print("Already stopped!")
        }
    }
    
    @IBAction func forwardEndbuttonTapped(_ sender: Any) {
        currentTrackIndex = (currentTrackIndex + 1) % trackNames.count
        loadTrack(trackName: trackNames[currentTrackIndex])
        PlayButton(sender)
    }
    
    @IBAction func backwardEndButtonTapped(_ sender: Any) {
        currentTrackIndex = (currentTrackIndex - 1 + trackNames.count) % trackNames.count
        loadTrack(trackName: trackNames[currentTrackIndex])
        PlayButton(sender)
    }    
}
