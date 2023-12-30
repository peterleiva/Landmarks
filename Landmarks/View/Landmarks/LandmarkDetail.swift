//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Peter on 30/12/23.
//

import SwiftUI

struct LandmarkDetail: View {
  @Environment(ModelData.self) var modelData
  var landmark: Landmark
  
  var landmarkIndex: Int {
    modelData.landmarks.firstIndex(where: {$0.id == landmark.id}) ?? -1
  }
  
    var body: some View {
      @Bindable var modelData = modelData
      
      ScrollView {
        MapView(coordinate: landmark.locationCoordinate)
          .frame(height: 300)
        
        CircleImage(image: landmark.image)
          .offset(y: -130)
          .padding(.bottom, -130)
        
        VStack(alignment: .leading) {
          HStack {
            Text(landmark.name)
              .font(.title)
              .fontWeight(.bold)

            FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
          }
          
          subtitle(subheadline: landmark.park, location: landmark.state)
          
          Divider()
          
          VStack(alignment: .leading) {
            Text("About \(landmark.name)").font(.title2).fontWeight(.medium)
              .padding(.bottom, 2)

            Text(landmark.description)
          }

        }.padding()
      }
      .navigationTitle(landmark.name)
      .navigationBarTitleDisplayMode(.inline)
    }
  
  func subtitle(subheadline: String, location: String) -> some View {
    HStack {
      Text(subheadline)
      Spacer()
      Text(location)
    }.font(.subheadline).foregroundStyle(.secondary)
  }
}

#Preview {
  LandmarkDetail(landmark: ModelData().landmarks[2])
    .environment(ModelData())
}
