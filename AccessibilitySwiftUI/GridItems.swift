//
//  AccessibilityTree.swift
//  AccessibilitySwiftUI
//
//  Created by Sahil Sharma on 2024-03-16.
//

import SwiftUI

struct Car {
    let name: String
    let imageName: String
}

struct CarGridItem: View {
    let car: Car
       
    var body: some View {
        VStack {
            /// Accessibility will Car Name
            Text(verbatim: car.name).padding(.top)
            
            Image(decorative: car.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 100)
                .clipped()
            
            HStack {
                /// Accessibility Action
                Button(action: {}, label: {
                    Text("Message")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                })
                
                /// Accessibility Action
                Button(action: {}, label: {
                    Text("Add to Favorites")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(8)
                })
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
        /// Accessibility Grouping: Voiceover will one element here, and read car name
        /// and suggests the action availables i.e. Message, and Add to Favorites
        .accessibilityElement(children: .combine)
        .background(Color.green.gradient.opacity(0.25))
        .cornerRadius(10)
        .shadow(radius: 3)
        .padding()
    }
}

struct GridView: View {
    let items = [
        Car(name: "Sedan Four Door", imageName: "image1"),
        Car(name: "Coupe Two Door", imageName: "image3"),
        Car(name: "Police Car", imageName: "image3"),
        Car(name: "Taxi", imageName: "image4")
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem()], spacing: 20) {
                ForEach(items, id: \.self.name) { item in
                    CarGridItem(car: item)
                }
            }
            .padding()
        }
    }
}

struct CarsGridContentView: View {
    var body: some View {
        NavigationStack {
            GridView()
                .navigationTitle("Cars Grid View")
        }
        
    }
}

#Preview {
    CarsGridContentView()
}
