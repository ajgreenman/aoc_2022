//
//  Day8.swift
//  aoc22
//
//  Created by Andrew Greenman on 12/7/22.
//

import Foundation

class Day8 {
    public static func solve() {
        guard let input = FileService.readFile("day8_input") else {
            return
        }
        
        var grid = [[Int]]()
        
        input.enumerateLines { line, _ in
            grid.append(line.compactMap{$0.wholeNumberValue})
        }
        
        _part1(grid)
        _part2(grid)
    }
    
    static func _part1(_ grid: [[Int]]) -> Void {
        var visibleTrees = 0
        
        for(i, row) in grid.enumerated() {
            for(j, tree) in row.enumerated() {
                if(_isVisible(tree: tree, i: i, j: j, grid: grid)) {
                    visibleTrees += 1
                }
            }
        }
        
        print(visibleTrees)
    }
    
    static func _part2(_ grid: [[Int]]) -> Void {
        var mostScenic = 0
        
        for(i, row) in grid.enumerated() {
            for(j, tree) in row.enumerated() {
                let scenicScore = _getScenicScore(tree: tree, i: i, j: j, grid: grid)
                if(scenicScore > mostScenic) {
                    mostScenic = scenicScore
                }
            }
        }
        
        print(mostScenic)
    }
    
    static func _getScenicScore(tree: Int, i: Int, j: Int, grid: [[Int]]) -> Int {
        var top = 0
        for x in (0 ..< i).reversed() {
            top += 1
            
            if(grid[x][j] >= tree) {
                break
            }
        }
        
        
        var bottom = 0
        if(i != grid.count - 1) {
            for x in i + 1 ..< grid.count {
                bottom += 1
                
                if(grid[x][j] >= tree) {
                    break
                }
            }
        }
        
        var left = 0
        for y in (0 ..< j).reversed() {
            left += 1
            
            if(grid[i][y] >= tree) {
                break
            }
        }
        
        
        var right = 0
        for y in j + 1 ..< grid[i].count {
            right += 1
            
            if(grid[i][y] >= tree) {
                break
            }
        }
        
        
        return top * bottom * left * right
    }
    
    static func _isVisible(tree: Int, i: Int, j: Int, grid: [[Int]]) -> Bool {
        if(i == 0 || j == 0 || i == grid.count - 1 || j == grid[i].count - 1) {
            // Outside of grid
            return true
        }
        
        var visibleDirections = 4
        
        for x in 0 ..< i {
            if(grid[x][j] >= tree) {
                visibleDirections -= 1
                break
            }
        }
        
        for x in i + 1 ..< grid.count {
            if(grid[x][j] >= tree) {
                visibleDirections -= 1
                break
            }
        }
        
        for y in 0 ..< j {
            if(grid[i][y] >= tree) {
                visibleDirections  -= 1
                break
            }
        }
        
        for y in j + 1 ..< grid[i].count {
            if(grid[i][y] >= tree) {
                visibleDirections -= 1
                break
            }
        }
        
        return visibleDirections > 0
    }
}
