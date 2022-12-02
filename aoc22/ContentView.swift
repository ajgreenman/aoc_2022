//
//  ContentView.swift
//  aoc22
//
//  Created by Andrew Greenman on 12/1/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("Day 1", action: day1).padding()
            Button("Day 2", action: day2).padding()
        }
    }
    
    func day1() {
        guard let input = FileService.readFile("day1_input") else {
            return
        }
        
        var elves = [ElfModel]()
        var currentElf = ElfModel()
        
        input.enumerateLines { line, _ in
            if let item = Int(line) {
                currentElf.addItem(item)
            } else {
                elves.append(currentElf)
                currentElf = ElfModel()
            }
        }
        
        let totals = elves.map { $0.total }
            .sorted(by: {$0 > $1})[0..<3]
        
        print(totals.first!)
        print(totals.reduce(0, +))
    }
    
    func day2() {
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
    
    func _performBattle(_ opponent: String, _ you: String) -> Int {
        if(opponent == "A") {
            if(you == "X") {
                return 4
            }
            if(you == "Y") {
                return 8
            }
            return 3
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
        if(opponent == "C") {
            if(you == "X") {
                return 7
            }
            if(you == "Y") {
                return 2
            }
            return 6
        }
        return 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
