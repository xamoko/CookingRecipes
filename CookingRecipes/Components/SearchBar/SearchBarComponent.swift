//
//  SearchBarComponent.swift
//  CookingRecipes
//
//  Created by Xavier Morales on 18/07/23.
//

import Foundation
import UIKit

class SearchBarComponent: UIView {
    
    //initWithFrame to init view from code
      override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
          textView()
          print("searchBar1")
      }
      
      //initWithCode to init view from xib or storyboard
      required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
          setupView()
          textView()
          print("searchBar2")
      }
    
    //common func to init our view
      private func setupView() {
          //self.backgroundColor = .red
          self.translatesAutoresizingMaskIntoConstraints = false
      }
    
    private func textView() {
        let textView = UITextView()
        textView.contentInsetAdjustmentBehavior = .automatic
        textView.center = self.center
        textView.textAlignment = NSTextAlignment.justified

        textView.layer.borderColor = CGColor.init(red: 85/255, green: 85/255, blue: 85/255, alpha: 1)
        textView.layer.shadowColor = CGColor.init(red: 205/255, green: 201/255, blue: 195/255, alpha: 1)
        textView.clipsToBounds = false
        textView.layer.shadowOpacity = 1
        textView.layer.shadowOffset = CGSizeMake(3, 3)
        textView.layer.borderWidth = 1
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.layer.cornerRadius = 8
        addSubview(textView)
        
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            textView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            textView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            textView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
    }
}
