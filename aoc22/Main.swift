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
            Button("Day 1", action: Day1.solve).padding()
            Button("Day 2", action: Day2.solve).padding()
            Button("Day 3", action: Day3.solve).padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
