//
//  MapView.swift
//  AfricaBook
//
//  Created by Sarika on 30.03.22.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State private var region: MKCoordinateRegion = {
        var mapCordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCordinates, span: mapZoomLevel)
        return mapRegion
    }()
    
    let location : [NationalParkLocation] = Bundle.main.decode("locations.json")
    var body: some View {
        //-Basic map
        //Map(coordinateRegion: $region)
        
        //-Map with annotation
        Map(coordinateRegion: $region, annotationItems: location) { item in
            //1. pin - old styyle(always static)
            //MapPin(coordinate: item.location, tint: .accentColor)
            
            //2.marker - new style(always static)
            //MapMarker(coordinate: item.location, tint: .accentColor)
            
            //3.custom basic annotation(it could be interactive)
            /*MapAnnotation(coordinate: item.location) {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32, alignment: .center)
            }*/
            
            //4. custom advanced annotation(it could be interactive)
            MapAnnotation(coordinate: item.location){
                MapAnnotationView(location: item)
            }
        }//: MAP
        .overlay(
            HStack(alignment: .center, spacing: 12) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
                
                VStack(alignment: .leading, spacing: 3) {
                    HStack {
                        Text("Latitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        
                        Spacer()
                        
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                    
                    Divider()
                    
                    HStack {
                        Text("Longitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        
                        Spacer()
                        
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                    
                }
            }//: HSTACK
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .background(
                    Color.black
                        .cornerRadius(8)
                        .opacity(0.6)
                )
                .padding()
                ,alignment: .top
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
