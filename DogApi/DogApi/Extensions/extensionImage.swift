import Foundation
import UIKit
var imageCache = NSCache<NSURL, UIImage>()

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                //                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                //                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data,
                let image = UIImage(data: data)
            else {
                return }
            imageCache.setObject(image,
                                 forKey: url as NSURL)
            
            DispatchQueue.main.async { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
