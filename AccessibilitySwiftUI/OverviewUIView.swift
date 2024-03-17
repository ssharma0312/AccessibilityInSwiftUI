//
//  OverviewUIView.swift
//  AccessibilitySwiftUI
//
//  Created by Sahil Sharma on 2024-03-16.
//

import SwiftUI

struct OverviewUIView: View {
    let items = ["Images", "Picker, Button, TextField & Slider", "Accessibility Tree", "Accessibility Sort Priority"]
    var body: some View {
        NavigationStack {
            
            VStack(alignment: .leading) {
                Text("Select type of element to learn their accessibility usage")
                   .font(.subheadline)
                   .padding(.leading)
                   
                List(items, id: \.self) { item in
                    NavigationLink(destination: destinationView(for: item)) {
                        Text(item)
                    }
                }
            }
            
            .navigationTitle("Select Element")
        }
    }
    
    // Function to return the destination view based on the selected item
    @ViewBuilder
    func destinationView(for item: String) -> some View {
        switch item {
        case "Images":
            ImageView()
        case "Picker, Button, TextField & Slider":
            PickerView()
        case "Accessibility Tree":
            CarsGridContentView()
        case "Accessibility Sort Priority":
            SortPriority()
        default:
            EmptyView() // Default empty view
        }
    }
}

#Preview {
    OverviewUIView()
}
