//
//  ContentView.swift
//  Mapview
//
//  Created by Evan Liu on 2022/9/19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      NavigationView {
        List {
          NavigationLink {
             BasicMapView()
          } label: {
            Text("SwiftUI Map View")
          }
          
          NavigationLink {
            MapView()
              .navigationBarTitleDisplayMode(.inline)
              .ignoresSafeArea(.all, edges: .bottom)
          } label: {
            Text("UIKit Map View")
          }
        }
        .navigationTitle("Map View")
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
