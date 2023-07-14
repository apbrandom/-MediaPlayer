//
//  Track.swift
//  AVFoundation_Audio
//
//  Created by Vadim Vinogradov on 14.07.2023.
//

import Foundation

struct Track {
    var name: String
    
    static func make() -> [String] {
        let trackNames = [
            "Queen",
            "Tuesday",
            "Stolen Dance",
            "Goodbye",
            "Castle In The Snow",
            "Bounce Bitch"
        ]
        return trackNames
    }
}
