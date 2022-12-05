//
//  Day5.swift
//  aoc22
//
//  Created by Andrew Greenman on 12/5/22.
//

import Foundation

class Day5 {
    
    // each crate is 3 characters ("[N]") plus a space for a total of 4
    static let crateCharacters = 4
    
    public static func solve() {
        guard let input = FileService.readFile("day5_input") else {
            return
        }
        
        guard let firstLine = input.components(separatedBy: .newlines).first else {
            return
        }
        
        let numberOfStacks = (firstLine.count + 1) / crateCharacters
        
        let crates = _readCratesFromInput(input, numberOfStacks)
        
        _part1(input, crates)
        _part2(input, crates)
    }
    
    static func _readCratesFromInput(_ input: String, _ count: Int) -> [[Character]] {
        var stacks = Array(repeating: Array<Character>(), count: count)
        
        input.enumerateLines { line, _ in
            if(line.first == "[") {
                for i in stride(from: 1, to: line.count - 1, by: crateCharacters) {
                    let index = line.index(line.startIndex, offsetBy: i)
                    if(line[index].isLetter) {
                        stacks[i / crateCharacters].append(line[index])
                    }
                }
            } else {
                // stop enumerating when there's no more crates
                return
            }
        }
        
        return stacks
    }
    
    static func _part1(_ input: String, _ crates: [[Character]]) -> Void {
        var crates = crates
        
        input.enumerateLines { line, _ in
            if(line.first == "m") {
                let instructions = line.split(separator: " ")
                guard let count = Int(instructions[1]),
                      let from = Int(instructions[3]),
                      let to = Int(instructions[5]) else {
                    return
                }
                
                for _ in 0 ..< count {
                    crates[to - 1].insert(crates[from - 1].removeFirst(), at: 0)
                }
            }
        }
        
        _printTop(crates)
    }
    
    static func _part2(_ input: String, _ crates: [[Character]]) -> Void {
        var crates = crates
        
        input.enumerateLines { line, _ in
            if(line.first == "m") {
                let instructions = line.split(separator: " ")
                guard let count = Int(instructions[1]),
                      let from = Int(instructions[3]),
                      let to = Int(instructions[5]) else {
                    return
                }
                
                var cratesToMove = [Character]()
                for _ in 0 ..< count {
                    cratesToMove.append(crates[from - 1].removeFirst())
                }
                crates[to - 1].insert(contentsOf: cratesToMove, at: 0)
            }
        }
        
        _printTop(crates)
    }
    
    static func _printTop(_ crates: [[Character]]) -> Void {
        var topCrates = ""
        
        for i in 0 ..< crates.count {
            guard let topCrate = crates[i].first else {
                return
            }
            
            topCrates.append(topCrate)
        }
        
        print(topCrates)
    }
}
