//
//  ContentView.swift
//  AccessibilitySwiftUI
//
//  Created by Sahil Sharma on 2024-03-16.
//

import SwiftUI

struct ImageView: View {
    var body: some View {
        NavigationStack {
            VStack {
                /// If you want VoiceOver to read your image, add label base initializer to images for accessibility
                Text("Accessible Image")
                Image("image754",
                      label: Text("Easter Egg Basket"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200)
                
                Divider()
                Spacer()
                
                /// If you do not want VoiceOver to read your image, create image using decorative initializer
                Text("Non-Accessible Image")
                Image(decorative: "image754")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200)
                
                Spacer()
            }
            .navigationTitle("Images Accessibility")
        }
        
        
    }
}

#Preview {
    ImageView()
}
