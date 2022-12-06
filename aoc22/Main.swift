//
//  ContentView.swift
//  aoc22
//
//  Created by Andrew Greenman on 12/1/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("Day 1", action: Day1.solve)
            Button("Day 2", action: Day2.solve)
            Button("Day 3", action: Day3.solve)
            Button("Day 4", action: Day4.solve)
            Button("Day 5", action: Day5.solve)
            Button("Day 6", action: Day6.solve)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
