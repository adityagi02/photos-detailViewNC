//
//  mediaDetailView.swift
//  imageDetailView-NC
//
//  Created by Aditya Tyagi  on 23/09/23.
//

import SwiftUI
import MapKit


struct mediaDetailView: View {
    let time : Date?
    let imageName : String
    let deviceName: String
    let imageExtension : String
    let cameraMode : String
    let apertureValue : Int
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
                CameraDetailsView(time: Date(), imageName: "IMG_002", deviceName: "Apple iPhone 12 Pro", imageExtension: "Hief", cameraMode: "Front Camera", apertureValue: 23, cameraFocalLength: 2.2, iso: 40, cameraMP: 12, imageHeight: 4032, imageWidth: 3024, imageSize: 2.3, imageEV: 0, cameraShutterSpeed: 124, dismiss: {})
                
                
                // Group of Map View + Location
                mapDetailView(longitude: Double(self.longitude), latitude: Double(self.latitude), location: self.location)
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
}

struct MapSettingView_Previews: PreviewProvider {
    static var previews: some View {
        mediaDetailView(time: Date(), imageName: "IMG_002", deviceName: "Apple iPhone 12 Pro", imageExtension: "Hief", cameraMode: "Front Camera", cameraAperture: 23, cameraFocalLength: 2.2, iso: 40, cameraMP: 12, imageHeight: 4032, imageWidth: 3024, imageSize: 2.3, imageEV: 0, cameraShutterSpeed: 124, longitude: Int32(-116.166_868), latitude: Int32(34.011_286), location: "Delhi, India",  dismiss: {})
    }
}
