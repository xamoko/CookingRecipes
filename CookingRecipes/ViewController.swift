//
//  ViewController.swift
//  CookingRecipes
//
//  Created by Xavier Morales on 18/07/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var myTableView: UITableView!
    
    lazy var searchBar: UIView = {
       let searchBar = SearchBarComponent()
        return searchBar
    }()
    
    private let sections: NSArray = ["fruit", "vegitable"]    //Profile    network    audio Codecs
        private let fruit: NSArray = ["apple", "orange", "banana", "strawberry", "lemon"]
        private let vegitable: NSArray = ["carrots", "avocado", "potato", "onion"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //NetworkConnectData().apiConnection()
        print("runApp")
        view.addSubview(searchBar)
        addTable()
        myTableView.delegate = self
        let guide = view.safeAreaLayoutGuide
        let margins = view.layoutMarginsGuide
        view.backgroundColor = .darkGray
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: guide.topAnchor, constant: 50),
            searchBar.topAnchor.constraint(equalTo: margins.topAnchor, constant: 0),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            searchBar.bottomAnchor.constraint(equalTo: guide.topAnchor, constant: 150),
            searchBar.bottomAnchor.constraint(equalTo: margins.topAnchor, constant: 60)
        ])
    }
    
    func addTable() {
        myTableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height))
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        myTableView.dataSource = self
        
        //myTableView.separatorColor = UIColor.clear
           self.view.addSubview(myTableView)
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        myTableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 30).isActive = true
        myTableView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        myTableView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        myTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
       }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
           cell.textLabel!.text = "\(fruit[indexPath.row])"
           return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Se presiona")
        let vc = RecipDescriptionViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        //self.present(vc, animated: true)
        
    }

}

