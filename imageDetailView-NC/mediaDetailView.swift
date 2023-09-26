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
        
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                
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
                Group{
                    
                    // Camera Model Name
                    HStack(alignment: .center){
                        Text("\(deviceName)").bold()
                        Spacer()
                        
                        VStack{
                            Text("\(imageExtension.uppercased())").background(Color.black.opacity(0.3))
                        }.padding()
                            .frame(width: 100, height : 34)
                            .cornerRadius(5)
                    }.padding(.horizontal)
                        .background(Color(UIColor.systemGray5))
                        .padding(.horizontal)
                        //.frame(height : 40)
                    
                    // Camera Info
                    
                    
                    
                    HStack{
                        Text("\(cameraMode) ⎯ \(cameraAperture) mm ƒ\(String(format: "%.1f", Double(round(1000*cameraFocalLength)/1000)))").padding(.leading, 7)
                    }.padding(.horizontal)
                    HStack{
                        Text(cameraMP < 1 ? String(format: "%.1f MP", cameraMP) : "\(Int(cameraMP)) MP").padding(.leading, 7)
                        Text("• \(String(imageWidth)) x \(String(imageHeight)) • \(String(format: "%.1f", Double(round(1000*imageSize)/1000))) MB")
                    }.padding(.horizontal)
                    Divider().padding(.horizontal)
                    
                    
                    
                    
//                    
//                    let spacing: CGFloat = {
//                        if UIDevice.current.userInterfaceIdiom == .pad {
//                            // For iPads, you can use a different spacing value
//                            return geometry.size.width * 0.072
//                        } else {
//                            if horizontalSizeClass == .regular && verticalSizeClass == .compact {
//                                return geometry.size.width * 0.9
//                            }
//                            // For iPhones, use your original spacing value
//                            return geometry.size.width / 18
//                        }
//                    }()
                    
                    
                    
                    
                    
                    HStack(alignment: .center, spacing: 0) {
                        HStack(alignment: .center, spacing : 0){
                            Text("ISO \(iso)")
                        }.padding()
                        Divider()
                        HStack{
                            Text("\(cameraAperture) mm")
                        }.padding()
                        Divider()
                        HStack{
                            Text("\(imageEV) ev")
                        }.padding()
                        Divider()
                        HStack{
                            Text("f\(String(format: "%.1f", Double(round(1000 * cameraFocalLength) / 1000)))")
                        }.padding()
                        Divider()
                        HStack{
                            Text("1/\(String(format: "%.1f", Double(round(1000 * cameraShutterSpeed) / 1000))) s")
                        }.padding()
                    }
                    .padding(.horizontal)
                    .frame(height: 10)
                    .font(.footnote)
                    .font(.system(size: 78))
                }
                
                // Map View
                Group{
                    MapView(coordinate: CLLocationCoordinate2D(latitude: CLLocationDegrees(latitude), longitude: CLLocationDegrees(longitude)))
                        .padding(.horizontal)
                        .ignoresSafeArea(edges: .top)
                                        .frame(height: 150)
                    HStack{
                        Button("\(location)"){
                            
                        }
                        Text(">")
                    }.padding(.top, -10)
                    .padding(.horizontal)
                    .frame(height : 30)
                }
                .padding(.bottom, 10)
                // Download Button
                
                HStack(alignment : .center){
                    Button("Download High Resolution Image") {

                    }
                    .frame(alignment: .center)
                   .frame(width: geometry.size.width)
                }.padding(.horizontal)
                    .padding(.trailing)
                    .background(Color(UIColor.systemGray5))
                    .padding(.horizontal)
                    .frame(height : 40)
            }
        }
    }
}

struct MapSettingView_Previews: PreviewProvider {
    static var previews: some View {
        mediaDetailView(time: Date(), imageName: "IMG_002", deviceName: "Apple iPhone 12 Pro", imageExtension: "Hief", cameraMode: "Front Camera", cameraAperture: 23, cameraFocalLength: 2.2, iso: 40, cameraMP: 12, imageHeight: 4032, imageWidth: 3024, imageSize: 2.3, imageEV: 0, cameraShutterSpeed: 124, longitude: Int32(-116.166_868), latitude: Int32(34.011_286), location: "Delhi, India",  dismiss: {})
    }
}