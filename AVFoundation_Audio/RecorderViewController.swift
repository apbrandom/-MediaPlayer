//
//  RecorderViewController.swift
//  AVFoundation_Audio
//
//  Created by Vadim Vinogradov on 17.07.2023.
//

import UIKit
import AVFAudio

class RecorderViewController: UIViewController {
    
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
        
    }
    
    @IBAction func playButtonTapped(_ sender: Any) {
    }
    
}
