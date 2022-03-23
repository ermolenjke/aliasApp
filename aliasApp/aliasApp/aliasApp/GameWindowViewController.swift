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
    @IBOutlet weak var leftTime: UIProgressView!
    
    var timer = Timer()
    var totalTime = 60
    var passedTime = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        isHiddenTrue()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelTapped))
//        updateUI()
        
    }
    
    
    @IBAction func startTapped(_ sender: UIButton) {
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1.0 }
        startButton.isHidden = true
        isHiddenFalse()
        timer.invalidate()
        leftTime.progress = 0.0
        passedTime = 0
        gameField.text = gameModel.wordsArray.removeFirst()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(updateTimer), userInfo:nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if passedTime < totalTime {
            passedTime += 1
            leftTime.progress = Float(passedTime) / Float(totalTime)
        } else {
            timer.invalidate()
            let alertController = UIAlertController(title: "Игра закончена", message: "Вы набрали \(passedTime)", preferredStyle: .alert)
            let action = UIAlertAction (title: "Выйти", style: .default) { action in
                let vc = self.storyboard!.instantiateViewController(withIdentifier: "newGameWindow")
                self.navigationController!.pushViewController(vc, animated: true)
            }
            
            alertController.addAction(action)
            self.present(alertController, animated: true)
        }
    }
    
    @IBAction func plusTapped(_ sender: UIButton) {
        
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1.0
            
        }
        guard gameModel.wordsArray.count != 0 else {return}
        gameField.text! = gameModel.wordsArray.removeFirst()
//        gameModel.nextWord()
    }
    
    @IBAction func minusTapped(_ sender: UIButton) {
        
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1.0
            
        }
        //gameModel.nextWord()
        guard gameModel.wordsArray.count != 0 else {return}
        gameField.text! = gameModel.wordsArray.removeFirst()
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
        leftTime.isHidden = true
    }
    
    func isHiddenFalse() {
        gameField.isHidden = false
        plusButton.isHidden = false
        minusButton.isHidden = false
        scoreLabel.isHidden = false
        leftTime.isHidden = false
    }
    
    func updateUI() {
            gameField.text = gameModel.getWords()
            scoreLabel.text = "Score: \(gameModel.getScore())"
            
        }
}

    
