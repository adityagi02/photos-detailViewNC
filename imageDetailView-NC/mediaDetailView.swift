//
//  mediaDetailView.swift
//  imageDetailView-NC
//
//  Created by Aditya Tyagi  on 23/09/23.
//

import SwiftUI
import CoreLocation
import MapKit


struct mediaDetailView: View {
    let time : Date?
    let imageName : String
    let deviceName: String
    let imageExtension : String
    let cameraMode : String
    let apertureValue : Int
    let lensLength : Double
    let iso : Int
    let megaPixels : Int
    let height : Int
    let width : Int
    let imageSize : Double
    let exposureValue : Int
    let shutterSpeedApex : Double
    let longitude : Int32
    let latitude : Int32
    let location : String
    
    @State private var dayLabel : String = ""
    @State private var dateLabel : String = ""
    @State private var timeLabel : String = ""
    
    var DateLabel : String {
        guard let date = time else {
            return "No date information"
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        dayLabel = formatter.string(from: date)
        
        formatter.dateFormat = "d MMM yyyy"
        dateLabel = formatter.string(from: date)
        
        formatter.dateFormat = "HH:mm"
        timeLabel = formatter.string(from: date)
        
        return "\(dayLabel) • \(dateLabel) • \(timeLabel)"
    }
    
    
    let dismiss: () -> Void
    
    var body: some View {
        
        @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
        @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
        
        GeometryReader { geometry in
            VStack(alignment: .leading, spacing: -8) {
                
                // Date information
                HStack {
                    VStack {
                        Text("\(DateLabel)")
                            .padding(.leading)
                            .opacity(0.8)
                        
                        // Image Name Information
                        Text("\(imageName)")
                            .padding(.leading)
                            .opacity(0.8)
                    }
                    
                    Spacer()
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                        .font(.system(size: 26))
                        .onTapGesture { dismiss() }
                }.padding(.horizontal)
                
                
                // Camera Information
                CameraDetailsView
                
                
                // Group of Map View + Location
                mapDetailView
                    .padding(.leading, 0)
                    .padding(.trailing, 0)
                    .padding(.top, -7)
                
                
                // Download Button
                downloadButtonView.padding()
                    .padding(.leading, 0)
                    .padding(.trailing, 0)
                    .padding(.top, -7)
            }
            //.frame(maxWidth: 800, alignment: .center)
        }
    }
    
    
    
    
    
    @ViewBuilder
    var downloadButtonView : some View {
        HStack(alignment: .bottom, spacing: 10) {
            // Action sheet/Action Sheet Semibold
            Button("Download High Resolution Image") {
                
            }
            .font(
                Font.custom("SF Pro Text", size: 20)
                    .weight(.semibold)
            )
            .multilineTextAlignment(.center)
            .foregroundColor(Color.accentColor)
        }
        .padding(.bottom, 10)
        .padding(.top, 10)
        .frame(maxWidth: .infinity, alignment: .bottom)
        .background(Color(UIColor.systemGray5))
        .cornerRadius(10)
    }
    
    
    @ViewBuilder
    var mapDetailView: some View {
        // Map View
        
        Group {
            HStack {
                VStack {
                    MapView(coordinate: CLLocationCoordinate2D(latitude: CLLocationDegrees(latitude), longitude: CLLocationDegrees(longitude)))
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
        let coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(latitude), longitude: CLLocationDegrees(longitude))
        let placemark = MKPlacemark(coordinate: coordinate)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = location
        mapItem.openInMaps()
    }
    
    @ViewBuilder
    var CameraDetailsView: some View {
        // Camera Information
        VStack{
            
            HStack{
                Text("\(deviceName)")
                    .bold()
                    .foregroundColor(.primary)
                    .padding(.leading, -4)
                
                Spacer()
                
                VStack{
                    Text("\(imageExtension.uppercased())") .foregroundColor(.white)
                }.padding(.leading, 4)
                    .padding(.trailing, 4)
                    .background(Color.black.opacity(0.3))
                    .cornerRadius(3)
                
                
            }.padding(.top, 10)
                .padding(.leading)
                .padding(.bottom, 2)
                .padding(.trailing)
            
            Divider().background(Color.gray)
            
            HStack{
                Text("\(cameraMode) ⎯ \(lensLength) mm ƒ\(String(format: "%.1f", Double(round(Double(1000*apertureValue))/1000)))")
                    .foregroundColor(.primary.opacity(0.6))
                    .padding(.leading, -4)
                Spacer()
                
            }.padding(.leading)
            
            
            HStack{
                Text(megaPixels < 1 ? String(format: "%.1f MP", megaPixels) : "\(Int(megaPixels)) MP")
                    .padding(.leading, 7)
                    .padding(.trailing, -3)
                
                Text("• \(String(width)) x \(String(height)) • \(String(format: "%.1f", Double(round(1000*imageSize)/1000))) MB")
                
                Spacer()
                
            }
            .padding(.top, -6)
            .padding(.leading, 4.6)
            .foregroundColor(.primary.opacity(0.6))
            
            Divider()
                .background(Color.gray)
            
            GeometryReader{ geo in
                HStack(spacing: 0) {
                    VStack {
                        Text("ISO \(iso)")
                    }
                    .frame(width: geo.size.width * 0.2, alignment: .center)
                    .fixedSize()
                    Divider().background(.gray)
                    
                    VStack {
                        Text("\(lensLength) mm")
                    }
                    .frame(width: geo.size.width * 0.2, alignment: .center)
                    .fixedSize()
                    Divider().background(.gray)
                    
                    VStack {
                        Text("\(exposureValue) ev")
                    }
                    .frame(width: geo.size.width * 0.2, alignment: .center)
                    .fixedSize()
                    Divider().background(.gray)
                    
                    VStack {
                        Text("ƒ\(String(format: "%.1f", Double(round(Double(1000 * apertureValue)) / 1000)))")
                    }
                    .frame(width: geo.size.width * 0.2, alignment: .center)
                    .fixedSize()
                    Divider().background(.gray)
                    
                    VStack {
                        Text("1/\(String(format: "%.0f", Double(round(1000 * shutterSpeedApex) / 1000))) s")
                    }
                    .frame(width: geo.size.width * 0.2, alignment: .center)
                    .fixedSize()
                }.font(.system(size: 13))
                    .frame(height: 17)
                    .foregroundColor(.primary.opacity(0.6))
            }.frame(height: 25)
        }
        .background(Color(UIColor.systemGray5))
        .cornerRadius(10)
        .padding()
    }
    
    
}

//struct MapSettingView_Previews: PreviewProvider {
//    static var previews: some View {
//        mediaDetailView(time: Date(), imageName: "IMG_002", deviceName: "Apple iPhone 12 Pro", imageExtension: "Hief", cameraMode: "Front Camera", cameraAperture: 23, cameraFocalLength: 2.2, iso: 40, cameraMP: 12, imageHeight: 4032, imageWidth: 3024, imageSize: 2.3, imageEV: 0, cameraShutterSpeed: 124, longitude: Int32(-116.166_868), latitude: Int32(34.011_286), location: "Delhi, India",  dismiss: {})
//    }
//}
