//
//  CardViewController.swift
//  CookingRecipes
//
//  Created by Xavier Morales on 20/07/23.
//

import UIKit

class CardViewController: UIView {
    
        override init(frame: CGRect) {
            super.init(frame: frame)
            self.backgroundColor = UIColor(red: 251/255, green: 247/255, blue: 240/255, alpha: 1)
            self.layer.cornerRadius = 10
            self.layer.shadowColor = CGColor.init(red: 85/255, green: 85/255, blue: 85/255, alpha: 1)
            self.clipsToBounds = false
            self.layer.shadowOpacity = 1
            self.layer.shadowOffset = CGSizeMake(3, 3)
            self.layer.borderWidth = 1
            self.translatesAutoresizingMaskIntoConstraints = false
        }

        required init(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

    
}
