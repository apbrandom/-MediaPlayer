//
//  RecorderViewController.swift
//  AVFoundation_Audio
//
//  Created by Vadim Vinogradov on 17.07.2023.
//

import UIKit
import AVFAudio
import UniformTypeIdentifiers

class RecorderViewController: UIViewController {
    
    var audioRecorder: AVAudioRecorder?
    var audioPlayer: AVAudioPlayer?
    
    @IBOutlet weak var recordButtonImage: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        DispatchQueue.main.async {
        //            AVAudioSession.sharedInstance().requestRecordPermission { granted in
        //                if !granted {
        //                    // Если доступ запрещен, вы можете предпринять соответствующие действия, например, показать предупреждение пользователю
        //                    print("Доступ к микрофону запрещен")
        //                }
        //            }
        //        }
    }
    
    @IBAction func recordButtonTapped(_ sender: Any) {
        if audioRecorder?.isRecording == true {
            //stop recording
            audioRecorder?.stop()
            audioRecorder = nil
            
            recordButtonImage.setImage(UIImage(named: "record.fill"), for: .normal)
            print("Record stopped")
        } else {
            // start recording
            let audioFileName = getDocumentsDirectory().appendingPathComponent("recording", conformingTo: UTType.wav)
            
            let settings: [String : Any] = [
                AVFormatIDKey: Int(kAudioFormatLinearPCM),
                AVSampleRateKey: 44100.0,
                AVNumberOfChannelsKey: 2,
                AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
            ]
            
            do {
                audioRecorder = try AVAudioRecorder(url: audioFileName, settings: settings)
                audioRecorder?.record()
                print("Record started")
                
                recordButtonImage.setImage(UIImage(named: "stop"), for: .normal)
            } catch {
                print("Error when created AVAudioRecorder: \(error.localizedDescription)")
            }
            
        }
    }
        
        @IBAction func playButtonTapped(_ sender: Any) {
            guard let audioFileName = audioRecorder?.url else {
                print("Recorded audio not found")
                return
            }
            
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: audioFileName)
                audioPlayer?.play()
                print("Playing recorded audio")
            } catch {
                print("Recorded audio playing error: \(error.localizedDescription)")
            }
        }
        
        func getDocumentsDirectory() -> URL {
            let patch = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
            return patch[0]
        }
    }
