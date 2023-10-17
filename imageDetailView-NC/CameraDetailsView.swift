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
    let apertureValue : Int
    let lensLength : Double
    let iso : Int
    let megaPixels : Int
    let height : Int
    let width : Int
    let imageSize : Double
    let exposureValue : Int
    let shutterSpeedApex : Double
    
    
    let dismiss: () -> Void
    
    var body: some View {
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

struct CameraDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CameraDetailsView(time: Date(), imageName: "IMG_002", deviceName: "Apple iPhone 12 Pro", imageExtension: "Hief", cameraMode: "Front Camera", apertureValue: 23, lensLength: 2.2, iso: 40, megaPixels: 12, height: 4032, width: 3024, imageSize: 2.3, exposureValue: 0, shutterSpeedApex: 124, dismiss: {})
    }
}
