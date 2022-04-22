
import UIKit

class ImageViewCell: UITableViewCell {
 
private var prepared = false
    
    private var imageDogView = UIImageView()
    var resultsBreedName: String? = ""{
        didSet {
            
            guard let resultBreedName =  resultsBreedName else {return}

            let url = URL(string: resultBreedName)
            if let image = imageCache.object(forKey: url! as NSURL){
                self.imageDogView.image = image
            } else {
           
                self.imageDogView.downloaded(from: url!)
            }

        }
    }
    
    
    
    func prepare(){
        if !prepared{
        contentView.addSubview(imageDogView)

     
        setImageConstraint()
        configureImageView () 
        prepared = true
            imageDogView.image = UIImage(named: "placeholder")
        }
      
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        imageDogView.image = UIImage(named: "placeholder")
        
    }
    
    
 private func configureImageView () {
     imageDogView.layer.cornerRadius = 10
     imageDogView.clipsToBounds = true
}
    private func setImageConstraint(){
        imageDogView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            imageDogView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
//            characterImageView.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            imageDogView.centerXAnchor.constraint(equalTo:contentView.centerXAnchor),
            imageDogView.heightAnchor.constraint(equalToConstant: 150),
       
            imageDogView.widthAnchor.constraint(equalTo:  imageDogView.heightAnchor,multiplier: 16/9)

        ])
    }
      
}
  
