//
//  MapView+MKMapView.swift
//  Mapview
//
//  Created by Evan Liu on 2022/9/20.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
  typealias UIViewType = MKMapView
  
  func makeCoordinator() -> MapCoordinator {
    MapCoordinator()
  }
  
  func makeUIView(context: Context) -> MKMapView {
    let mapView = MKMapView()
    let gRecognizer = UITapGestureRecognizer(target: context.coordinator, action: #selector(MapCoordinator.touch(gestureRecognizer:)))
    mapView.addGestureRecognizer(gRecognizer)
    mapView.delegate = context.coordinator
    context.coordinator.initMap(mapView)
    return mapView
  }
  
  func updateUIView(_ uiView: MKMapView, context: Context) {
    uiView.showsUserLocation = true
    uiView.isZoomEnabled = true
    uiView.isScrollEnabled = true
    uiView.isRotateEnabled = false
    uiView.isPitchEnabled = false
    uiView.showsScale = true
    uiView.showsCompass = true
    uiView.showsTraffic = false
    uiView.showsBuildings = false
    
    let loc = CLLocationCoordinate2D(latitude: 30.539708, longitude: 119.965898)
    let region = MKCoordinateRegion(center: loc, span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
    
    uiView.setRegion(uiView.regionThatFits(region), animated: true)
  }
  
  class MapCoordinator: NSObject, MKMapViewDelegate {
    var mMapView: MKMapView?
    
    func initMap(_ mapView: MKMapView) {
      mMapView = mapView
    }
    
    func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
      print(mapView.centerCoordinate)
    }
    
    @objc func touch(gestureRecognizer: UITapGestureRecognizer) {
      let point = gestureRecognizer.location(in: gestureRecognizer.view)
      let loc = mMapView?.convert(point, toCoordinateFrom: mMapView)
    }
  }
}

struct MapView_Previews: PreviewProvider {
  static var previews: some View {
    MapView()
  }
}
