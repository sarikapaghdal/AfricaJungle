//
//  InsetMapView.swift
//  AfricaBook
//
//  Created by Sarika on 31.03.22.
//

import SwiftUI
import MapKit

struct InsetMapView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599), span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0)) //span describes zoom level in map , the smaller the value, the higher is the zoom level
    
    var body: some View {
        Map(coordinateRegion: $region)
            .overlay(NavigationLink(destination: MapView()){
                HStack{
                    Image(systemName: "mappin.circle")
                        .foregroundColor(.white)
                        .imageScale(.large)
                    
                    Text("Location")
                        .foregroundColor(.accentColor)
                        .fontWeight(.bold)
                }//: HSTACK
                .padding(.vertical, 10)
                .padding(.horizontal, 14)
                .background(
                    Color.black
                        .opacity(0.3)
                        .cornerRadius(8)
                )
            }//: NAVIGATION
                .padding(12)
                     ,alignment: .topTrailing
            )
            .frame(height: 256)
            .cornerRadius(12)
    }
}

struct InsetMapView_Previews: PreviewProvider {
    static var previews: some View {
        InsetMapView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
