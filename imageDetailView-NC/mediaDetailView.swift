//
//  mediaDetailView.swift
//  imageDetailView-NC
//
//  Created by Aditya Tyagi  on 23/09/23.
//

import SwiftUI
import MapKit


struct mediaDetailView: View {
    let time : Date
    let imageName : String
    let deviceName: String
    let imageExtension : String
    let cameraMode : String
    let cameraAperture : Int
    let cameraFocalLength : Double
    let iso : Int
    let cameraMP : Int
    let imageHeight : Int
    let imageWidth : Int
    let imageSize : Double
    let imageEV : Int
    let cameraShutterSpeed : Double
    let longitude : Int32
    let latitude : Int32
    let location : String
    
    let dismiss: () -> Void
    
    var body: some View {
        
        @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
        @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
        
        ScrollView {
            GeometryReader { geometry in
                VStack(alignment: .leading, spacing: -8) {
                    
                    // Date information
                    HStack {
                        Text("No date information").bold()
                        Spacer()
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray)
                            .font(.system(size: 26))
                            .onTapGesture { dismiss() }
                    }.padding(.horizontal)
                    
                    
                    // Image Name Information
                    Text("\(imageName)").padding(.horizontal).opacity(0.8)
                    
                    // Camera Information
                    CameraDetailsView(time: Date(), imageName: "IMG_002", deviceName: "Apple iPhone 12 Pro", imageExtension: "Hief", cameraMode: "Front Camera", cameraAperture: 23, cameraFocalLength: 2.2, iso: 40, cameraMP: 12, imageHeight: 4032, imageWidth: 3024, imageSize: 2.3, imageEV: 0, cameraShutterSpeed: 124, dismiss: {})
                    
                    
                    // Group of Map View + Location
                    mapDetailView(longitude: self.longitude, latitude: self.latitude, location: self.location)
                        .padding(.leading, 0)
                        .padding(.trailing, 0)
                        .padding(.top, -7)
                    
                    
                    // Download Button
                    downloadButtonView.padding()
                        .padding(.leading, 0)
                        .padding(.trailing, 0)
                        .padding(.top, -7)
                }
            }
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
}

struct MapSettingView_Previews: PreviewProvider {
    static var previews: some View {
        mediaDetailView(time: Date(), imageName: "IMG_002", deviceName: "Apple iPhone 12 Pro", imageExtension: "Hief", cameraMode: "Front Camera", cameraAperture: 23, cameraFocalLength: 2.2, iso: 40, cameraMP: 12, imageHeight: 4032, imageWidth: 3024, imageSize: 2.3, imageEV: 0, cameraShutterSpeed: 124, longitude: Int32(-116.166_868), latitude: Int32(34.011_286), location: "Delhi, India",  dismiss: {})
    }
}
