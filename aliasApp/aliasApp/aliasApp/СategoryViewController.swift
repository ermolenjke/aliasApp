//
//  ViewController.swift
//  aliasApp
//
//  Created by Даниил Ермоленко on 23.02.2022.
//

import UIKit

class CategoryViewController: UITableViewController {
    
    var gameModel = GameModel()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    // MARK: - Table View Data Source
    override func tableView(_ tableView: UITableView,numberOfRowsInSection section: Int) -> Int {
        return gameModel.gameModel.count
    }
    
    override func tableView(_ tableView: UITableView,cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"CategoryItem")
        cell?.textLabel?.text = gameModel.gameModel[indexPath.row].category
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    // MARK: - Table View Delegate
    override func tableView(_ tableView: UITableView,didSelectRowAt indexPath: IndexPath)   {
        tableView.deselectRow(at: indexPath, animated: true)
        let category = gameModel.gameModel[indexPath.row]
        guard let vc = self.storyboard!.instantiateViewController(withIdentifier: "gameWindow") as? GameWindowViewController else {
            return
        }
        vc.gameFieldText = category.wordsOfCategory.shuffled().first ?? "error"
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

    


























//
//    @IBOutlet weak var tableView: UITableView!
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return gameCategory.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
//        cell?.textLabel?.text = gameCategory[indexPath.row]
//        return cell!
//    }
//
    
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        guard let vc = storyboard?.instantiateViewController(withIdentifier: "gameWindow") as? GameWindowViewController else {
//            return
//        }
//
//        vc.navigationItem.largeTitleDisplayMode = .never
//        navigationController?.pushViewController(vc, animated: true)
//
//    }



