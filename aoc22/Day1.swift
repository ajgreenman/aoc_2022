//
//  Day1.swift
//  aoc22
//
//  Created by Andrew Greenman on 12/3/22.
//

import Foundation

class Day1 {
    public static func solve() {
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
}
