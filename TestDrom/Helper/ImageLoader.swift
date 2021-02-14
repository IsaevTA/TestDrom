//
//  ImageLoader.swift
//  TestDrom
//
//  Created by Timur Isaev on 14.02.2021.
//

import UIKit

class ImageLoader {
    
    static let shared = ImageLoader()
    
    var session: URLSession!
    var cache: NSCache<NSString, UIImage>!
    
    init() {
        session = URLSession.shared
        self.cache = NSCache()
    }
    
    func obtainImageWithPath(imagePath: String?, completionHandler: @escaping (UIImage) -> ()) {
        guard let urlImage = imagePath, urlImage != "" else { return }
        if let image = self.cache.object(forKey: urlImage as NSString) {
            DispatchQueue.main.async {
                completionHandler(image)
            }
        } else {
            let url: URL! = URL(string: urlImage)
            session.downloadTask(with: url, completionHandler: { (location, response, error) in
                if let data = try? Data(contentsOf: url) {
                    let img: UIImage! = UIImage(data: data)
                    self.cache.setObject(img, forKey: urlImage as NSString)
                    DispatchQueue.main.async {
                        completionHandler(img)
                    }
                }
            }).resume()
        }
    }
}
