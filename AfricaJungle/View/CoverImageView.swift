//
//  CoverImageView.swift
//  AfricaJungle
//
//  Created by Sarika on 19.04.22.
//

import SwiftUI

struct CoverImageView: View {
    //MARK: PROPERTIES
    let coverImages: [CoverImage] = Bundle.main.decode("covers.json")
    
    //MARK: BODYY
    var body: some View {
        TabView {
            ForEach(coverImages) { item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
            }//: LOOP
        }//: TAB
        .tabViewStyle(PageTabViewStyle())
    }
}

//MARK: PREVIEW
struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}

