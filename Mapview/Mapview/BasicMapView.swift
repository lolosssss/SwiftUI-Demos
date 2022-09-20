//
//  BasicMapView.swift
//  Mapview
//
//  Created by Evan Liu on 2022/9/20.
//

import SwiftUI
import MapKit

struct BasicMapView: View {
  @State var region = MKCoordinateRegion(
    center: CLLocationCoordinate2D(latitude: 30.539708, longitude: 119.965898),
    span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
  )
  @State var trackingMode = MapUserTrackingMode.follow
  
  var body: some View {
    Map(coordinateRegion: $region, interactionModes: .all, showsUserLocation: true, userTrackingMode: $trackingMode)
      .ignoresSafeArea(.all, edges: .bottom)
      .navigationBarTitleDisplayMode(.inline)
  }
}

struct BasicMapView_Previews: PreviewProvider {
  static var previews: some View {
    BasicMapView()
  }
}
