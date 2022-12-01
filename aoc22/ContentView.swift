//
//  ContentView.swift
//  aoc22
//
//  Created by Andrew Greenman on 12/1/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button("Calculate", action: calculateHighestTotal)
    }
    
    func calculateHighestTotal() {
        guard let input = FileService.readFile("day1_input") else {
            return
        }
        var elves = [ElfModel]()
        var currentElf = ElfModel()
        input.enumerateLines { value, _ in
            if let item = Int(value) {
                currentElf.addItem(item: item)
            } else {
                elves.append(currentElf)
                currentElf = ElfModel()
            }
        }
        let totals = elves.map { $0.total }
        print(totals.max()!)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
