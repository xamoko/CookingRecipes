//
//  ImageViewController.swift
//  CookingRecipes
//
//  Created by Xavier Morales on 20/07/23.
//

import UIKit

class ImageViewController: UIImageView {
    
    var imageName: String = ""

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpImage()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpImage() {
        self.image = UIImage(named: imageName)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
}
