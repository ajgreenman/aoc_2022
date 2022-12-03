//
//  Day2.swift
//  aoc22
//
//  Created by Andrew Greenman on 12/3/22.
//

import Foundation

class Day2 {
    public static func solve() {
        guard let input = FileService.readFile("day2_input") else {
            return
        }
        
        var score = 0
        
        input.enumerateLines { line, _ in
            let battle = line.components(separatedBy: " ")
            score += _performBattle(battle[0], battle[1])
        }
        
        print("Score: \(score)")
    }
    
    static func _performBattle(_ opponent: String, _ you: String) -> Int {
        if(opponent == "A") {
            if(you == "X") {
                return 3
            }
            if(you == "Y") {
                return 4
            }
            return 8
        }
        if(opponent == "B") {
            if(you == "X") {
                return 1
            }
            if(you == "Y") {
                return 5
            }
            return 9
        }
        if(you == "X") {
            return 2
        }
        if(you == "Y") {
            return 6
        }
        return 7
    }
}
