//
//  mapDetailView.swift
//  imageDetailView-NC
//
//  Created by Aditya Tyagi  on 29/09/23.
//

import SwiftUI
import CoreLocation
import MapKit

struct mapDetailView: View {
    let longitude: Double  // Changed the data type to Double for better accuracy
    let latitude: Double   // Changed the data type to Double for better accuracy
    let location: String
    
    var body: some View {
        // Map View
        
        Group {
            HStack {
                VStack {
                    MapView(coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
                        .ignoresSafeArea(edges: .top)
                        .frame(height: 100)
                        .padding(.bottom, -12)
                    
                    HStack {
                        Button("\(location) 〉", action: {
                            openInMaps()
                        })
                        Spacer()
                    }
                    .padding(.leading, 5)
                    .padding(.top, 12)
                    .padding(.bottom, 10)
                }
                .background(Color(UIColor.systemGray5))
                .cornerRadius(10)
                .padding()
            }
        }
    }
    
    func openInMaps() {
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let placemark = MKPlacemark(coordinate: coordinate)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = location
        mapItem.openInMaps()
    }
}


struct mapDetailView_Previews: PreviewProvider {
    static var previews: some View {
        mapDetailView(longitude: Double(-116.166_868), latitude: Double(34.011_286), location: "Delhi, India")
    }
}
