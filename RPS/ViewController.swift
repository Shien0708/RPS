//
//  ViewController.swift
//  RPS
//
//  Created by 方仕賢 on 2022/3/28.
//

import UIKit

class ViewController: UIViewController {
    
    //再玩一次按鈕
    @IBOutlet weak var againButton: UIButton!
    //玩家出拳按鈕
    @IBOutlet var playerButtons: [UIButton]!
    
    //遊戲狀態 label
    @IBOutlet weak var gameStateLabel: UILabel!
    //對手出拳 label
    @IBOutlet weak var compLabel: UILabel!
    
    //玩家
    var player: Sign!
    //遊戲狀態
    var gameState: GameState!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayStatingView()
        
    }
    
    //呈現開始狀態的畫面
    func displayStatingView() {
        gameState = .start
        gameStateLabel.text = gameState.status
        changeBackgroundColor()
        againButton.isHidden = true
        compLabel.text = ""
    }
    
    //隱藏玩家按鈕
    func hideButtons(displayButtonIndex: Int) {
        switch displayButtonIndex {
        case 0:
            playerButtons[1].isHidden = true
            playerButtons[2].isHidden = true
            playerButtons[0].isEnabled = false
        case 1:
            playerButtons[0].isHidden = true
            playerButtons[2].isHidden = true
            playerButtons[1].isEnabled = false
        default:
            playerButtons[0].isHidden = true
            playerButtons[1].isHidden = true
            playerButtons[2].isEnabled = false
        }
    }
    
    //玩家按下按你的 IBAction
    @IBAction func press(_ sender: UIButton) {
        let comp = randomSign()
        compLabel.text = comp.emoji
        
        switch sender {
        case playerButtons[0]:
            hideButtons(displayButtonIndex: 0)
            player = Sign.rock
        case playerButtons[1]:
            hideButtons(displayButtonIndex: 1)
            player = Sign.paper
        default:
            hideButtons(displayButtonIndex: 2)
            player = Sign.scissors
        }
        
        gameState = player.gameState(against: comp)
        gameStateLabel.text = gameState.status
        changeBackgroundColor()
        againButton.isHidden = false
    }
    
    func changeBackgroundColor(){
        switch gameState {
        case .win:
            view.backgroundColor = .green
        case .lose:
            view.backgroundColor = .red
        case .draw:
            view.backgroundColor = .cyan
        default:
            view.backgroundColor = .white
        }
    }
    
    //再玩一次的 IBAction
    @IBAction func playAgain(_ sender: Any) {
        for i in 0...playerButtons.count-1 {
            playerButtons[i].isHidden = false
            playerButtons[i].isEnabled = true
        }
        displayStatingView()
    }
    
}


