//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Peter on 30/12/23.
//

import SwiftUI

struct LandmarkRow: View {
  var landmark: Landmark
  
    var body: some View {
      HStack {
        landmark.image.resizable().frame(width: 50, height: 50)
        
        Text(landmark.name)

        Spacer()
        
        if landmark.isFavorite {
          Image(systemName: "star.fill").foregroundStyle(.yellow)
        }
      }
    }
}

#Preview("All landmarks") {
  ScrollView {
    ForEach(ModelData().landmarks) { l in
      LandmarkRow(landmark: l)
      Divider()
    
    }.padding()
  }
}


#Preview("Turtle Rock") {
  Group {
    LandmarkRow(landmark: ModelData().landmarks[0])
    LandmarkRow(landmark: ModelData().landmarks[1])
  }
}
