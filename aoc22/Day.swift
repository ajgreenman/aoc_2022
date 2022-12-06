//
//  Day.swift
//  aoc22
//
//  Created by Andrew Greenman on 12/5/22.
//

import Foundation

class Day {
    let day: Int
    let solver: () -> Void
    
    init(_ day: Int, _ solver: @escaping () -> Void) {
        self.day = day
        self.solver = solver
    }
}
