//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Peter on 30/12/23.
//

import SwiftUI

struct LandmarkDetail: View {
  var landmark: Landmark
  
    var body: some View {
      ScrollView {
        MapView(coordinate: landmark.locationCoordinate)
          .frame(height: 300)
        
        CircleImage(image: landmark.image)
          .offset(y: -130)
          .padding(.bottom, -130)
        
        TitleView(landmark: landmark)
        Divider()
        
        VStack(alignment: .leading) {
          Text("About \(landmark.name)").font(.title2).fontWeight(.medium)
            .padding(.bottom, 2)
          Text(landmark.description)
        }.padding()
      }
      .navigationTitle(landmark.name)
      .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    LandmarkDetail(landmark: landmarks[2])
}
