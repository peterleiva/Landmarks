//
//  TitleView.swift
//  Landmarks
//
//  Created by Peter on 30/12/23.
//

import SwiftUI

struct TitleView: View {
  var landmark: Landmark

    var body: some View {
      VStack(alignment: .leading) {
        Text(landmark.name).font(.title).fontWeight(.bold)
        subtitle(subheadline: landmark.park, location: landmark.state)
      }
      .padding()
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
  TitleView(landmark: landmarks[0])
}
