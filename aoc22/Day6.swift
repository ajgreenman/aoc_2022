//
//  Day6.swift
//  aoc22
//
//  Created by Andrew Greenman on 12/6/22.
//

import Foundation

class Day6 {
    public static func solve() {
        guard let input = FileService.readFile("day6_input") else {
            return
        }
        
        print(_part1(input))
        print(_part2(input))
    }
    
    static func _part1(_ input: String) -> Int {
        return _findSequence(input, sequenceLength: 4)
    }
    
    static func _part2(_ input: String) -> Int {
        return _findSequence(input, sequenceLength: 14)
    }
    
    static func _findSequence(_ input: String, sequenceLength: Int) -> Int {
        if(input.count < sequenceLength) {
            return 0
        }
        
        for i in sequenceLength ... input.count {
            let start = input.index(input.startIndex, offsetBy: i - sequenceLength)
            let end = input.index(input.startIndex, offsetBy: i - 1)
            
            let letterSet = Set(input[start ... end])
            
            if(letterSet.count == sequenceLength) {
                return i
            }
        }
        
        return 0
    }
}
