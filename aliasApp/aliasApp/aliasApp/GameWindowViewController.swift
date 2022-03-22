//
//  GameWindowViewController.swift
//  aliasApp
//
//  Created by Даниил Ермоленко on 23.02.2022.
//

import UIKit

class GameWindowViewController: UIViewController {
    
    var gameModel = GameModel()
    @IBOutlet weak var gameField: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    public var gameFieldText: String = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameField.text = gameFieldText
        isHiddenTrue()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelTapped))
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        updateUI()
    }
    
    @IBAction func startTapped(_ sender: UIButton) {
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1.0 }
        startButton.isHidden = true
        isHiddenFalse()
    }
    
    @IBAction func plusTapped(_ sender: UIButton) {
        
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1.0
            
        }
//        guard model.easyMode.count != 0 else {return}
//        gameField.text! = model.easyMode.removeFirst()
        
//        model.nextWord()
    }
    
    @IBAction func minusTapped(_ sender: UIButton) {
        
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1.0
            
        }
//        model.nextWord()
        
//        guard model.easyMode.count != 0 else {return}
//        gameField.text! = model.easyMode.removeFirst()
    }
    //MARK: - Алерт для выхода из игры
    
    @objc func cancelTapped() {
        let alertController = UIAlertController(title: "Вы хотите выйти?", message: "Игра будет закончена", preferredStyle: .alert)
        let action = UIAlertAction (title: "Выйти", style: .destructive) { action in
            let vc = self.storyboard!.instantiateViewController(withIdentifier: "newGameWindow")
            self.navigationController!.pushViewController(vc, animated: true)
        }
        
        let actionTwo = UIAlertAction (title: "Назад", style:.default, handler: nil)
        alertController.addAction(actionTwo)
        alertController.addAction(action)
        
        self.present(alertController, animated: true)
    }
    
    func isHiddenTrue() {
        gameField.isHidden = true
        plusButton.isHidden = true
        minusButton.isHidden = true
        scoreLabel.isHidden = true
    }
    
    func isHiddenFalse() {
        gameField.isHidden = false
        plusButton.isHidden = false
        minusButton.isHidden = false
        scoreLabel.isHidden = false
    }
    
//    func  updateUI() {
//        gameFieldText = model.getWords()
//        scoreLabel.text = "Score: \(model.getScore())"
//    }
}
