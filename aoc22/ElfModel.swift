//
//  ElfModel.swift
//  aoc22
//
//  Created by Andrew Greenman on 12/1/22.
//

import Foundation

class ElfModel {
    var _calories: [Int]
    
    var total : Int {
        get {
            return _calories.reduce(0, +)
        }
    }
    
    init() {
        _calories = []
    }
    
    func simpleDescription() -> String {
        return "An elf carrying \(total) calories of amounts \(_calories.description)"
    }
    
    func addItem(_ item: Int) {
        _calories.append(item)
    }
}
