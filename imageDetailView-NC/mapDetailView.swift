//
//  mapDetailView.swift
//  imageDetailView-NC
//
//  Created by Aditya Tyagi  on 29/09/23.
//

import SwiftUI
import CoreLocation

struct mapDetailView: View {
    let longitude : Int32
    let latitude : Int32
    let location : String
    
    var body : some View {
        // Map View
        
        Group{
            HStack{
                VStack(){
                    MapView(coordinate: CLLocationCoordinate2D(latitude: CLLocationDegrees(latitude), longitude: CLLocationDegrees(longitude)))
                        .ignoresSafeArea(edges: .top)
                        .frame(height: 100)
                        .padding(.bottom, -12)
                    
                    HStack{
                        Button("\(location) ", action: {
                            
                        })
                        Spacer()
                    }.padding(.leading, 5)
                        .padding(.top, 12)
                        .padding(.bottom, 10)
                    
                }.background(Color(UIColor.systemGray5))
                    .cornerRadius(10)
                    .padding()
            }
        }
        
    }
}

struct mapDetailView_Previews: PreviewProvider {
    static var previews: some View {
        mapDetailView(longitude: Int32(-116.166_868), latitude: Int32(34.011_286), location: "Delhi, India")
    }
}
