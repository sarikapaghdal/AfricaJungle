//
//  AnimalDetailView.swift
//  AfricaBook
//
//  Created by Sarika on 30.03.22.
//

import SwiftUI

struct AnimalDetailView: View {
    
    let animal : Animal
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                
            //COVER IMAGE
            Image(animal.image)
                    .resizable()
                    .scaledToFit()
                
            //TITLE
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundColor(.primary)
                    .background(
                        Color.accentColor
                            .frame(height: 6)
                            .offset(y: 24)) //creates underline
                   
            //HEADLINE
                Text(animal.headline)
                    .font(.headline)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal)
                    .foregroundColor(.accentColor)
                
            //GALLERYY
                
                Group { //there is limitation of how many view we can use in swiftui, so we're using group here to bind related view togather
                    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
                    
                    InsertGalleryView(animal: animal)
                }
                .padding(.horizontal)
                
            //FACTS
                Group{
                   HeadingView(headingImage: "questionmark.circle", headingText: "Did you know?")
                    InsetFactView(animal: animal)
                }
                .padding(.horizontal)
                
                
            //DESCRIPTION
                Group{
                   HeadingView(headingImage: "info.circle", headingText: "All about \(animal.name)")
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                }
                .padding(.horizontal)
                
                
            //MAP
                
                Group{
                   HeadingView(headingImage: "map", headingText: "National Parks")
                    InsetMapView()
                }
                .padding(.horizontal)
                
            //LINK
                Group{
                   HeadingView(headingImage: "books.vertical", headingText: "Learn More")
                    ExternalWeblinkView(animal: animal)
                }
                .padding(.horizontal)
    
            }//: VSTACK
            .navigationTitle("Learn about \(animal.name)")
            .navigationBarTitleDisplayMode(.inline)
        }//: SCROLL
    }
}

struct AnimalDetailView_Previews: PreviewProvider {
    
    static let animals : [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        NavigationView {
            AnimalDetailView(animal: animals[1])
        }
    }
}
