//
//  CookingRecipesTests.swift
//  CookingRecipesTests
//
//  Created by Xavier Morales on 18/07/23.
//

import XCTest
@testable import CookingRecipes

final class CookingRecipesTests: XCTestCase{
    
    let sb = UIStoryboard(name: "Main", bundle: nil)
    
    
    func test_loading() {
        
        let sut: ViewController = self.sb.instantiateViewController(
        identifier: String(describing: ViewController.self))
        
        sut.loadViewIfNeeded()
        XCTAssertNotNil(sut.searchBar)
        XCTAssertNotNil(sut.title)
    }
    
    func test_table(){
        
        let sut: ViewController = self.sb.instantiateViewController(
        identifier: String(describing: ViewController.self))
        sut.loadViewIfNeeded()
        XCTAssertNotNil(sut.myTableView.dataSource, "dataSource")
        XCTAssertNotNil(sut.myTableView.delegate, "delegate")
    }
    
    func test_NumbersRows() {
        let sut: ViewController = self.sb.instantiateViewController(
        identifier: String(describing: ViewController.self))
        sut.loadViewIfNeeded()

        XCTAssertEqual(sut.myTableView.dataSource?.tableView(sut.myTableView, numberOfRowsInSection: 0), 3)
    }
}
