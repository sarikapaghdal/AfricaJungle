//
//  VideoListView.swift
//  AfricaBook
//
//  Created by Sarika on 30.03.22.
//

import SwiftUI

struct VideoListView: View {
    @State var video: [Video] = Bundle.main.decode("videos.json")//immutable property with @State wrapper
    
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    var body: some View {
        NavigationView {
            List{
                ForEach(video) { item in
                  NavigationLink(destination: VideoPlayerView(videoSelected: item.id, videoTitle: item.name)) {
                    VideoListItemView(video: item)
                      .padding(.vertical, 8)
                  }
                } //: LOOP
            }//: LIST
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Videos", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    Button {
                        video.shuffle()
                        hapticImpact.impactOccurred()
                    } label: {
                        Image(systemName: "arrow.2.squarepath")
                    }
                }
            }
        }
    }
}

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
