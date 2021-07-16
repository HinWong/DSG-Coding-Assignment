//
//  ImageCache.swift
//  SeatGeekAPI
//
//  Created by Hin Wong on 7/12/21.
//

import UIKit

class ImageCache {
    static let shared = ImageCache()
    private var cache = NSCache<NSString, UIImage>()
    private init() {}
    
    func loadImage(from urlString: String, completionHandler: ((UIImage) -> ())?) {
        guard let url = URL(string: urlString) else { return }
        let imageUrl = urlString as NSString
        if let cachedImage = cache.object(forKey: imageUrl) {
            DispatchQueue.main.async {
                completionHandler?(cachedImage)
            }
        } else {
            let task = URLSession.shared.dataTask(with: url) { (data, _, _) in
                if let myData = data, let image = UIImage(data: myData) {
                    self.cache.setObject(image, forKey: urlString as NSString)
                    DispatchQueue.main.async {
                        completionHandler?(image)
                    }
                }
            }
            task.resume()
        }
    }
}
