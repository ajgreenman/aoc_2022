//
//  Day7.swift
//  aoc22
//
//  Created by Andrew Greenman on 12/7/22.
//

import Foundation

class Day7 {
    static let maximumDirectorySize = 100000
    
    static let totalDiskSpace = 70000000
    static let spaceNeededForUpgrade = 30000000
    
    public static func solve() {
        guard let input = FileService.readFile("day7_input") else {
            return
        }
        
        let files = FileService()
        
        input.enumerateLines { line, _ in
            files.processCommand(line)
        }
        
        print(_part1(files))
        print(_part2(files))
    }
    
    static func _part1(_ files: FileService) -> Int {
        var smallDirectories: [Directory] = []
        
        files.root.depthFirstTraversal {
            if($0.size < maximumDirectorySize) {
                smallDirectories.append($0)
            }
        }
        
        return smallDirectories.map({$0.size}).reduce(0, +)
    }
    
    static func _part2(_ files: FileService) -> Int {
        let freeSpace = totalDiskSpace - files.root.size
        if(freeSpace > spaceNeededForUpgrade) {
            return 0
        }
        
        let spaceNeededToDelete = spaceNeededForUpgrade - freeSpace
        
        var directoryToDelete = files.root
        
        files.root.depthFirstTraversal {
            if($0.size > spaceNeededToDelete && $0.size < directoryToDelete.size) {
                directoryToDelete = $0
            }
        }
        
        return directoryToDelete.size
    }
}
