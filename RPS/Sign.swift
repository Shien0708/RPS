//
//  Sign.swift
//  RPS
//
//  Created by 方仕賢 on 2022/3/28.
//

import Foundation

enum Sign: String {
    case rock
    case paper
    case scissors
    
    //產生 emoji 圖
    var emoji: String {
        switch self {
        case .rock:
            return "👊"
        case .paper:
            return "🖐"
        case .scissors:
            return "✌️"
        }
    }
    
    //回傳輸贏狀況
    func gameState(against opponentSign: Sign) -> GameState {
        switch self {
        case .rock:
            if opponentSign == .scissors {
                return .win
            } else if opponentSign == .paper {
                return .lose
            }
        case .paper:
            if opponentSign == .rock {
                return .win
            } else if opponentSign == .scissors {
                return .lose
            }
        case .scissors:
            if opponentSign == .paper {
                return .win
            } else if opponentSign == .rock {
                return .lose
            }
        }
        return .draw
    }
}


//電腦隨機出拳
func randomSign() -> Sign {
    let sign = Int.random(in: 0...2)
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    } else {
        return .scissors
    }
}



