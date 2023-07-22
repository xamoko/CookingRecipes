//
//  RecipDescriptionViewController.swift
//  CookingRecipes
//
//  Created by Xavier Morales on 19/07/23.
//

import Foundation
import UIKit
import Kingfisher

class RecipDescriptionViewController: UIViewController {

    var name: String = ""
    var imageName: String = ""
    var descriptionRecipe: String = ""

    lazy var cardView: UIView = {
        let cardView = CardViewController()
        return cardView
    }()
    
  let someLabel: UITextView = {
       let someLabel = UITextView()
        someLabel.translatesAutoresizingMaskIntoConstraints = false
      someLabel.backgroundColor = UIColor(red: 251/255, green: 247/255, blue: 240/255, alpha: 1)
        return someLabel
    }()

    let someImageView: UIImageView = {
           let theImageView = UIImageView()
           theImageView.translatesAutoresizingMaskIntoConstraints = false
           return theImageView
        }()
    
    let geoButton: UIButton = {
        let geoButton = UIButton()
        geoButton.backgroundColor = .blue
        geoButton.setTitle("Ver mapa", for: .normal)
        geoButton.translatesAutoresizingMaskIntoConstraints = false
        geoButton.addTarget(self, action: #selector(mapRecip), for: .touchUpInside)
        return geoButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 205/255, green: 201/255, blue: 195/255, alpha: 1.0)
        self.title = self.name
        view.addSubview(cardView)

        customImage()
        customDescription()

        let safeAreaIn = view.safeAreaLayoutGuide
        let safeAreaOut = view.layoutMarginsGuide

        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: safeAreaIn.topAnchor, constant: 0),
            cardView.leadingAnchor.constraint(equalTo: safeAreaIn.leadingAnchor, constant: 10),
            cardView.trailingAnchor.constraint(equalTo: safeAreaIn.trailingAnchor, constant: -10),
            cardView.bottomAnchor.constraint(equalTo: safeAreaIn.bottomAnchor, constant: 0),
            
            cardView.topAnchor.constraint(equalTo: safeAreaOut.topAnchor, constant: 0),
            cardView.leadingAnchor.constraint(equalTo: safeAreaOut.leadingAnchor, constant: 10),
            cardView.trailingAnchor.constraint(equalTo: safeAreaOut.trailingAnchor, constant: -10),
            cardView.bottomAnchor.constraint(equalTo: safeAreaOut.bottomAnchor, constant: -10)
        ])
    }
    
    func customImage(){
        
        let url = URL(string: imageName)
        someImageView.kf.setImage(with: url)
        someImageView.backgroundColor = .black
        cardView.addSubview(someImageView)

        NSLayoutConstraint.activate([
            someImageView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 10),
            someImageView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 10),
            someImageView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -10),
            someImageView.bottomAnchor.constraint(equalTo: cardView.topAnchor, constant: 300)
        ])
    }

    func customDescription(){
        someLabel.text = descriptionRecipe.isEmpty ? "Description not available" : descriptionRecipe
        someLabel.font = UIFont.systemFont(ofSize: 20)

        cardView.addSubview(someLabel)
        cardView.addSubview(geoButton)

        NSLayoutConstraint.activate([
            someLabel.topAnchor.constraint(equalTo: someImageView.bottomAnchor, constant: 50),
            someLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 10),
            someLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -10),
            someLabel.bottomAnchor.constraint(equalTo: someImageView.bottomAnchor, constant: 300),
            
            geoButton.topAnchor.constraint(equalTo: someLabel.bottomAnchor, constant: 20),
            geoButton.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 10),
            geoButton.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -10),
            geoButton.bottomAnchor.constraint(equalTo: someLabel.bottomAnchor, constant: 50)
        ])
    }

    @objc func mapRecip() {
        let vc = GeolocationViewController()

        vc.latitude = 19.3906594
        vc.longitude = -99.3084247
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
