//
//  Day3.swift
//  aoc22
//
//  Created by Andrew Greenman on 12/3/22.
//

import Foundation

class Day3 {
    public static func solve() {
        guard let input = FileService.readFile("day3_input") else {
            return
        }
        
        print(_part1(input))
        print(_part2(input))
    }
    
    static func _part1(_ input: String) -> Int {
        var total = 0
        
        input.enumerateLines { line, _ in
            let firstChunk = String(line[..<line.index(line.startIndex, offsetBy: line.count / 2)])
            let secondChunk = String(line[line.index(line.endIndex, offsetBy: -line.count / 2)...])
            
            guard let commonValue = Set(firstChunk).intersection(Set(secondChunk)).first else {
                return
            }
            
            total += _getCharacterValue(commonValue)
        }
        
        return total
    }
    
    static func _part2(_ input: String) -> Int {
        var total = 0
        
        var group = [String]()
        
        input.enumerateLines { line, _ in
            group.append(line)
            
            if(group.count == 3) {
                let first = Set(group[0])
                let second = Set(group[1])
                let third = Set(group[2])
                
                guard let commonValue = first.intersection(second).intersection(third).first else {
                    return
                }
                
                total += _getCharacterValue(commonValue)
                
                group.removeAll()
            }
        }
        
        return total
    }
    
    static func _getCharacterValue(_ s: String.Element) -> Int {
        var characterValue: Int
        
        if(s.isUppercase) {
            characterValue = Int(s.asciiValue!) - 38
        } else {
            characterValue = Int(s.asciiValue!) - 96
        }
        
        return characterValue
    }
}
