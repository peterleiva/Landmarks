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
      }
    }
}

#Preview("All landmarks") {
  ScrollView {
    ForEach(landmarks) { l in
      LandmarkRow(landmark: l)
      Divider()
    
    }.padding()
  }
}


#Preview("Turtle Rock") {
  Group {
    LandmarkRow(landmark: landmarks[0])
    LandmarkRow(landmark: landmarks[1])
  }
}
