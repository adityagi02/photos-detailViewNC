//
//  CameraDetailsView.swift
//  imageDetailView-NC
//
//  Created by Aditya Tyagi  on 29/09/23.
//

import SwiftUI

struct CameraDetailsView: View {
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
    
    
    let dismiss: () -> Void
    
    var body: some View {
        // Camera Information
        VStack{
            
            HStack{
                Text("\(deviceName)")
                    .bold()
                    .foregroundColor(.white)
                
                Spacer()
                
                VStack{
                    Text("\(imageExtension.uppercased())") .foregroundColor(.white)
                }.padding(.leading, 4)
                    .padding(.trailing, 4)
                    .background(Color.black.opacity(0.3))
                
                
            }.padding(.top, 10)
                .padding(.leading)
                .padding(.bottom, 2)
                .padding(.trailing)
            
            Divider().background(Color.gray)
            
            HStack{
                Text("\(cameraMode) ⎯ \(cameraAperture) mm ƒ\(String(format: "%.1f", Double(round(1000*cameraFocalLength)/1000)))")
                    .foregroundColor(.gray)
                
                Spacer()
                
            }.padding(.leading)
            
            
            HStack{
                Text(cameraMP < 1 ? String(format: "%.1f MP", cameraMP) : "\(Int(cameraMP)) MP")
                    .padding(.leading, 7)
                    .padding(.trailing, -3)
                
                Text("• \(String(imageWidth)) x \(String(imageHeight)) • \(String(format: "%.1f", Double(round(1000*imageSize)/1000))) MB")
                
                Spacer()
                
            }
            .padding(.top, -6)
            .padding(.leading, 9)
            .foregroundColor(.gray)
            
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
                        Text("\(cameraAperture) mm")
                    }
                    .frame(width: geo.size.width * 0.2, alignment: .center)
                    .fixedSize()
                    Divider().background(.gray)
                    
                    VStack {
                        Text("\(imageEV) ev")
                    }
                    .frame(width: geo.size.width * 0.2, alignment: .center)
                    .fixedSize()
                    Divider().background(.gray)
                    
                    VStack {
                        Text("f\(String(format: "%.1f", Double(round(1000 * cameraFocalLength) / 1000)))")
                    }
                    .frame(width: geo.size.width * 0.2, alignment: .center)
                    .fixedSize()
                    Divider().background(.gray)
                    
                    VStack {
                        Text("1/\(String(format: "%.0f", Double(round(1000 * cameraShutterSpeed) / 1000))) s")
                    }
                    .frame(width: geo.size.width * 0.2, alignment: .center)
                    .fixedSize()
                }.font(.system(size: 13))
                    .frame(height: 17)
                    .foregroundColor(.gray)
            }.frame(height: 25)
        }
        .background(Color(UIColor.systemGray5))
        .cornerRadius(10)
        .padding()
    }
}

struct CameraDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CameraDetailsView(time: Date(), imageName: "IMG_002", deviceName: "Apple iPhone 12 Pro", imageExtension: "Hief", cameraMode: "Front Camera", cameraAperture: 23, cameraFocalLength: 2.2, iso: 40, cameraMP: 12, imageHeight: 4032, imageWidth: 3024, imageSize: 2.3, imageEV: 0, cameraShutterSpeed: 124, dismiss: {})
    }
}
