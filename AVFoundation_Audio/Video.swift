//
//  Video.swift
//  AVFoundation_Audio
//
//  Created by Vadim Vinogradov on 16.07.2023.
//

import UIKit

struct Video {
    let id: String
    let url: URL
    let title: String
    var image: UIImage?
    
    static func make() -> [Video] {
        let videoIDs = ["vMU7zJLx1CI", "TX9qSaGXFyg", "NX-ZJ-d27Fc", "WZeaQwvwc8s"]
        
        var videos = [Video]()
        for (index, id) in videoIDs.enumerated() {
            if let url = URL(string: "https://www.youtube.com/embed/\(id)"), let image = UIImage(named: "image_\(index)") {
                let video = Video(
                    id: id,
                    url: url,
                    title: "Video \(index + 1)",
                    image: image
                )
                videos.append(video)
            }
        }
        return videos
    }
    
//    static func loadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let data = data, let image = UIImage(data: data) {
//                completion(image)
//            } else {
//                print("Error loading image: \(error?.localizedDescription ?? "Unknown error")")
//                completion(nil)
//            }
//        }.resume()
//    }
}
