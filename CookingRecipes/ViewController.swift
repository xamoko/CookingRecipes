//
//  ViewController.swift
//  CookingRecipes
//
//  Created by Xavier Morales on 18/07/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var myTableView: UITableView!
    lazy var searchBar:UISearchBar = UISearchBar()
    var initPresenter = NetworkConnectData()
    var recipeData: [CoockList] = []
    var searchRecipesData: [CoockList] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        initPresenter.apiConnection()
        self.initPresenter.passingDataDeleate = self
        let guide = view.safeAreaLayoutGuide
        let margins = view.layoutMarginsGuide
        view.backgroundColor = .white
        self.title = "Tasty Recipes"
        
        searchBar.searchBarStyle = UISearchBar.Style.default
        searchBar.placeholder = " Search..."
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        searchBar.backgroundImage = UIImage()
        searchBar.delegate = self
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchBar)
        addTable()
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: guide.topAnchor, constant: 0),
            searchBar.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 0),
            searchBar.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: 0),
            searchBar.bottomAnchor.constraint(equalTo: guide.topAnchor, constant: 70)
        ])
    }
    
    func addTable() {
        
        let guide = view.safeAreaLayoutGuide
        let margins = view.layoutMarginsGuide
        
        myTableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height))

        myTableView.register(TableViewCellController.self, forCellReuseIdentifier: "MyCell")
        myTableView.delegate = self
        myTableView.dataSource = self
        self.view.addSubview(myTableView)
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        myTableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor).isActive = true
        myTableView.leftAnchor.constraint(equalTo: guide.leftAnchor).isActive = true
        myTableView.rightAnchor.constraint(equalTo: guide.rightAnchor).isActive = true
        myTableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
       }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.searchRecipesData.isEmpty ? self.recipeData.count : searchRecipesData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! TableViewCellController
        cell.imageName = "\(recipeData[indexPath.row].thumbnail_url)"
        cell.textLabels = "\(recipeData[indexPath.row].name)"
        cell.setupImage()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = RecipDescriptionViewController()
        vc.name = "\(recipeData[indexPath.row].name)"
        vc.imageName = "\(recipeData[indexPath.row].thumbnail_url)"
        vc.descriptionRecipe = "\(recipeData[indexPath.row].description)"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }

}

extension ViewController: PassingData {
    func showingDatas(datas: [CoockList]) {
        DispatchQueue.main.async {
            self.recipeData = datas
            self.myTableView.reloadData()
        }
    }
}

extension ViewController: UISearchBarDelegate {
   func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        searchRecipesData = []
        
        if searchText == ""{
            searchRecipesData = recipeData
        }
        
        for word in recipeData {
            if word.name.uppercased().contains(searchText.uppercased()) {
                searchRecipesData.append(word)
            }
        }
        DispatchQueue.main.async {
            self.myTableView.reloadData()
        }
    }
}

