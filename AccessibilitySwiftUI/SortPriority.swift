//
//  SortPriority.swift
//  AccessibilitySwiftUI
//
//  Created by Sahil Sharma on 2024-03-17.
//

import SwiftUI

struct SortPriority: View {
    var body: some View {
        NavigationStack {
            ZStack {
                /// VoiceOver will read the elements in the specified sort order priority
                /// Here, the blue square has the highest priority (sort order 1), followed by the red square (sort order 2), and then the green square (sort order 3).
                Color.blue
                    .frame(width: 200, height: 200)
                    .accessibility(label: Text("Blue Square"))
                    .accessibility(sortPriority: 1) // Sort order 1
                
                Color.red
                    .frame(width: 150, height: 150)
                    .accessibility(label: Text("Red Square"))
                    .accessibility(sortPriority: 2) // Sort order 2
                
                Color.green
                    .frame(width: 100, height: 100)
                    .accessibility(label: Text("Green Square"))
                    .accessibility(sortPriority: 3) // Sort order 3
            }
            
            Spacer()
            .navigationTitle("Accessibility Priority")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SortPriority()
    }
}
