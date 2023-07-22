//
//  TableViewCellController.swift
//  CookingRecipes
//
//  Created by Xavier Morales on 21/07/23.
//

import UIKit
import Kingfisher

class TableViewCellController: UITableViewCell {
    
    var imageName: String = ""
    var textLabels: String = ""
    
    lazy var someImageView: UIImageView = {
           let theImageView = UIImageView()
           theImageView.translatesAutoresizingMaskIntoConstraints = false
           return theImageView
        }()
    
    lazy var someLabel: UILabel = {
       let someLabel = UILabel()
        someLabel.translatesAutoresizingMaskIntoConstraints = false
        return someLabel
    }()
    
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        }

        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    func setupImage() {
        let url = URL(string: imageName)
        someImageView.kf.setImage(with: url)
        someLabel.text = textLabels
        addSubview(someImageView)
        addSubview(someLabel)
        print(imageName)
        NSLayoutConstraint.activate([
            someImageView.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            someImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            someImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            someImageView.bottomAnchor.constraint(equalTo: topAnchor, constant: 300),
            
            someLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            someLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            someLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
}
