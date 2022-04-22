
import UIKit

class ImageViewCell: UITableViewCell {
 
private var prepared = false
    
    private var imageDog = UIImageView()
    var results1: String? = ""{
        didSet {
            
            guard let results1 =  results1 else {return}

            let url = URL(string: results1)
            if let image = imageCache.object(forKey: url! as NSURL){
                self.imageDog.image = image
            } else {
           
                self.imageDog.downloaded(from: url!)
            }
            
                
            
//            self.imageDog.loadImage(urlString: results1, placeholderImage: <#T##UIImage?#>, errorImage: <#T##UIImage?#>)
            


        }
    }
    
    
    
    func prepare(){
        if !prepared{
        contentView.addSubview(imageDog)

     
        setImageConstraint()
        configureImageView () 
        prepared = true
            imageDog.image = UIImage(named: "placeholder")
        }
      
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        imageDog.image = UIImage(named: "placeholder")
        
    }
    
    
 private func configureImageView () {
     imageDog.layer.cornerRadius = 10
     imageDog.clipsToBounds = true
}
    private func setImageConstraint(){
        imageDog.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            imageDog.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
//            characterImageView.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            imageDog.centerXAnchor.constraint(equalTo:contentView.centerXAnchor),
            imageDog.heightAnchor.constraint(equalToConstant: 150),
       
            imageDog.widthAnchor.constraint(equalTo:  imageDog.heightAnchor,multiplier: 16/9)

        ])
    }
      
}
  
