//
//  ImageView.swift
//  EventsApp
//
//  Created by huda elhady on 20/08/2021.
//

import UIKit

let imageCache = NSCache<NSString, AnyObject>()

class DownloadImageView: UIImageView {
    var currentUrlString: String?
    
    func loadImage(from imageUrlString: String) {
        let urlString = imageUrlString as NSString
        currentUrlString = imageUrlString
        if let cachedImage = imageCache.object(forKey: urlString) as? UIImage{
            self.image = cachedImage
            return
        }
        DispatchQueue.global().async { [weak self] in
            if let url = URL(string: imageUrlString), let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    let cachedImage = image
                    DispatchQueue.main.async {
                        if self?.currentUrlString == imageUrlString {
                            self?.image = image
                        }
                    }
                    imageCache.setObject(cachedImage, forKey: urlString)
                }
            }
        }
    }
}
