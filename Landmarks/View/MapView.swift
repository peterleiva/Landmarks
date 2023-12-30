//
//  MapView.swift
//  Landmarks
//
//  Created by Peter on 30/12/23.
//

import SwiftUI
import MapKit

struct MapView: View {
  var coordinate: CLLocationCoordinate2D
  
    var body: some View {
      Map(position: .constant(.region(region)))
    }
  
  private var region: MKCoordinateRegion {
    MKCoordinateRegion(
      center: coordinate,
      span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
  }
}

#Preview {
  MapView(coordinate: CLLocationCoordinate2D(latitude: -22.90_278, longitude: -43.2075))
}
