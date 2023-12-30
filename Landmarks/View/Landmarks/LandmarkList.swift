//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Peter on 30/12/23.
//

import SwiftUI

struct LandmarkList: View {
  @Environment(ModelData.self) var modelData
  @State private var showFavoritesOnly = false;

    var body: some View {
      NavigationSplitView {
        List {
          Toggle(isOn: $showFavoritesOnly, label: {
            Text("Favorites only")
          })

          ForEach(filteredLandmarks) { l in
            NavigationLink { LandmarkDetail(landmark: l) }
              label: { LandmarkRow(landmark: l) }
          }
        }
        .animation(.default, value: filteredLandmarks)
        .navigationTitle("Landmarks")

      } detail: {
        Text("Select a Landmark")
      }
    }
  
  var filteredLandmarks: [Landmark] {
    modelData.landmarks.filter { l in !showFavoritesOnly || l.isFavorite }
  }
}

#Preview {
    LandmarkList()
      .environment(ModelData())
}
