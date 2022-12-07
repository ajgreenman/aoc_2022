//
//  Day7.swift
//  aoc22
//
//  Created by Andrew Greenman on 12/7/22.
//

import Foundation

class Day7 {
    public static func solve() {
        guard let input = FileService.readFile("day7_input") else {
            return
        }
        
        let fileService = FileService()
        
        input.enumerateLines { line, _ in
            fileService.processCommand(line)
        }
        
        print(_part1(files: fileService))
    }
    
    static func _part1(files: FileService) -> Int {
        var smallDirectories: [Directory] = []
        
        files.root.depthFirstTraversal {
            if($0.size < 100000) {
                smallDirectories.append($0)
            }
        }
        
        return smallDirectories.map({$0.size}).reduce(0, +)
    }
}
