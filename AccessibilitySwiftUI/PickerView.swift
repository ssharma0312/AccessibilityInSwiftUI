//
//  PickerView.swift
//  AccessibilitySwiftUI
//
//  Created by Sahil Sharma on 2024-03-16.
//

import SwiftUI

struct PickerView: View {
    private let availableCities = ["Calgary", "Edmonton", "Regina", "Saskatoon"]
    @State private var selectedCity = "Calgary"
    @State private var emergencyBtnSelected: Bool = false
    @State private var textValue = "Ronald"
    @State private var speed: Float = 45
    
    var body: some View {        
        NavigationStack {
            Spacer()
            VStack(alignment: .leading, spacing: 10) {
                Text("Accessibility for Pickers")
                /// Add label for VoiceOver
                Picker(selection: $selectedCity,
                       label: Text("Select City")) {
                    ForEach(availableCities.indices, id: \.self) { index in
                        Text(availableCities[index]).tag(index)
                    }
                }
                
        
                Divider()
                
                /// Hint: Voice will speak button label Emergency, and it's state selected or unselected
                Text("Accessibility for Buttons")
                
                Button("", systemImage: "exclamationmark.triangle.fill") {
                    print("Button Tapped")
                    emergencyBtnSelected.toggle()
                }
                .font(.largeTitle)
                .foregroundColor(emergencyBtnSelected ? .red : .primary)
                .accessibilityLabel("Emergency")
                .accessibilityAddTraits(emergencyBtnSelected ? .isSelected : [])
                
                Divider()
                
                /// Providing accessibility lable and value of the text field for the VoiceOver
                /// Add Reset accessibility action to reset the field to simply the interaction
                Text("Accessibility for TextField")
                TextField("", text: $textValue)
                    .accessibilityLabel(Text("Name"))
                    .accessibilityValue(Text("\(textValue)"))
                    .accessibilityAction(named: Text("Reset")) {
                        deleteNameText()
                    }
                
                Divider()
                
                /// Grouping neccessary elements
                Text("Accessibility for Sliders")
                Text(verbatim: String(format: "Speed %.0f", speed))
                Slider(value: $speed, in: 0...100)
                    .accessibilityLabel(Text("Speed"))
                    .accessibilityValue(
                        Text(verbatim: String(format: "%.0f", speed))
                    )
                
                Spacer()
               
            }
            .padding()
            .navigationTitle("A11y Elements")
            
        }
        
    }
    
    func deleteNameText() {
        textValue = ""
    }
}

#Preview {
    PickerView()
}
