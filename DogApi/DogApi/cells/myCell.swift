

import UIKit

class myCell: UITableViewCell {

  
        var results: String = ""{
            didSet {
                
                self.nameLabel.text = results
                

            }
        }
        
        
        private var nameLabel = UILabel()
        
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text?.removeAll()
        
    }
    
        func prepare(){
            
            contentView.addSubview(nameLabel)

         
       configureNameLabel()
            setNameLabelConstraint()

          
        }
    //

   
       
        
        
        
       
        
        private func configureNameLabel(){
            nameLabel.numberOfLines = 0
            nameLabel.adjustsFontSizeToFitWidth = true
        }
  
        
       
            
    //        expanded.toggle()
            
            
    //        myButton.addTarget(self, action: #selector(buttonTap), for: .touchUpInside )
            
        
    //
        
      
    //
        private  func setNameLabelConstraint(){
            nameLabel.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
                nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20),
                nameLabel.heightAnchor.constraint(equalToConstant: 60),
                nameLabel.trailingAnchor.constraint(equalTo:  contentView.trailingAnchor, constant: -12)

            ])
        }
        
}
      
