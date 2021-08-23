//
//  BackCollectionViewCell.swift
//  Wardrobe
//
//  Created by Heitor Feijó Kunrath on 10/08/21.
//

import UIKit

class BackCollectionViewCell: UICollectionViewCell {
 
    
    
    var typeOfCell : EnumForSegues?
    
    @IBOutlet weak var clotheImage: UIImageView!
    @IBOutlet weak var stack: UIStackView!
    @IBOutlet var label: UILabel!
    
    
    override func awakeFromNib(){
        super.awakeFromNib()
        configureWithOutLabel()
        
        
        
        
        
    }
    
    func configureWithOutLabel(){
        
        stack.removeArrangedSubview(label)
        label.isHidden = true
        
        
    }
    
    func configureWithlabel(){
        stack.addArrangedSubview(label)
        label.isHidden = false
        
        
        
    }
}
