//
//  Day4.swift
//  aoc22
//
//  Created by Andrew Greenman on 12/4/22.
//

import Foundation

class Day4 {
    public static func solve() {
        guard let input = FileService.readFile("day4_input") else {
            return
        }

        print(_part1(input))
        print(_part2(input))
    }
    
    static func _part1(_ input: String) -> Int {
        var total = 0
        
        input.enumerateLines { line, _ in
            let elfPair = line.split(separator: ",")
            if(elfPair.count != 2) {
                return
            }
            
            let firstElf = _getElfRange(String(elfPair[0]))
            let secondElf = _getElfRange(String(elfPair[1]))
            
            if(firstElf.first! <= secondElf.first! && firstElf.last! >= secondElf.last!) {
                total += 1
            } else if(secondElf.first! <= firstElf.first! && secondElf.last! >= firstElf.last!) {
                total += 1
            }
        }
        
        return total
    }
    
    static func _part2(_ input: String) -> Int {
        var total = 0
        
        input.enumerateLines { line, _ in
            let elfPair = line.split(separator: ",")
            if(elfPair.count != 2) {
                return
            }
            
            let firstElf = _getElfRange(String(elfPair[0]))
            let secondElf = _getElfRange(String(elfPair[1]))
            
            let overlap = Set(firstElf).intersection(Set(secondElf))
            if(!overlap.isEmpty) {
                total += 1
            }
        }
        
        return total
    }
    
    static func _getElfRange(_ elf: String) -> [Int] {
        let elfRange = elf.split(separator: "-")
        if(elfRange.count != 2) {
            return []
        }
        
        return Array(Int(elfRange[0])!...Int(elfRange[1])!)
    }
}
