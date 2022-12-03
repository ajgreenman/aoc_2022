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
        
        var total = 0
        
        input.enumerateLines { line, _ in
            let firstChunk = Set(String(line[..<line.index(line.startIndex, offsetBy: line.count / 2)]))
            let secondChunk = Set(String(line[line.index(line.endIndex, offsetBy: -line.count / 2)...]))
            
            guard let commonValue = firstChunk.intersection(secondChunk).first else {
                return
            }
            
            var characterValue: Int
            if(commonValue.isUppercase) {
                characterValue = Int(commonValue.asciiValue!) - 38
            } else {
                characterValue = Int(commonValue.asciiValue!) - 96
            }
            total += characterValue
        }
        
        print(total)
    }
}
