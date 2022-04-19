//
//  InsetFactView.swift
//  AfricaBook
//
//  Created by Sarika on 31.03.22.
//

import SwiftUI

struct InsetFactView: View {
    let animal : Animal
    
    var body: some View {
        GroupBox {
            TabView{
                ForEach(animal.fact, id: \.self) { item in
                    Text(item)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
        }//: BOX
    }
}

struct InsetFactView_Previews: PreviewProvider {
    static let animals : [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        InsetFactView(animal: animals[1])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
