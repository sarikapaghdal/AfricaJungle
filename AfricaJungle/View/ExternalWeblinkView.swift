//
//  ExternalWeblinkView.swift
//  AfricaBook
//
//  Created by Sarika on 31.03.22.
//

import SwiftUI

struct ExternalWeblinkView: View {
    let animal : Animal
    
    var body: some View {
        GroupBox{
            HStack {
                Image(systemName: "globe")
                Text("wikipedia")
                Spacer()
                
                Group {
                    Image(systemName: "arrow.up.right.square")
                    Link(animal.name, destination: URL(string: animal.link) ?? URL(string: "https://wikipedia.org")!)
                }
                .foregroundColor(.accentColor)
            }
        }//: BOX
    }
}

struct ExternalWeblinkView_Previews: PreviewProvider {
    static let animals : [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        
        ExternalWeblinkView(animal: animals[1])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
