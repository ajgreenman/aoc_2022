//
//  ContentView.swift
//  aoc22
//
//  Created by Andrew Greenman on 12/1/22.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedDay = 0
    var body: some View {
        VStack {
            Picker("Select day", selection: $selectedDay,
                   content: {
                ForEach(days.indices, id: \.self) {
                    Text("Day \(self.days[$0].day)")
                }
            })
            .padding()
            .accentColor(.green)
            Button("Solve", action: self.days[selectedDay].solver)
                .buttonStyle(.borderedProminent)
                .accentColor(.green)
        }
    }
    
    var days = [
        Day(1, Day1.solve),
        Day(2, Day2.solve),
        Day(3, Day3.solve),
        Day(4, Day4.solve),
        Day(5, Day5.solve),
        Day(6, Day6.solve),
        Day(7, Day7.solve),
    ]
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
