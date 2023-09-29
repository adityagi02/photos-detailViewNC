//
//  ContentView.swift
//  imageDetailView-NC
//
//  Created by Aditya Tyagi  on 23/09/23.
//

import SwiftUI
import BottomSheet

struct ContentView: View {
    @State var showList = false
    @State var showMapSetting = false
    
    var body: some View {
        VStack{
            Button(action: {
                self.showMapSetting = !showMapSetting
            }, label: {
                // Image(systemName: showMapSetting ? "info.fill" : "info" )
                Text("Details")
            })
            .listStyle(PlainListStyle())
                .bottomSheet(isPresented: $showList, height: 500) {
                }
                .bottomSheet(
                    isPresented: $showMapSetting,
                    height: 490,
                    topBarHeight: 16,
                    topBarCornerRadius: 16,
                    showTopIndicator: false
                ) {
                    mediaDetailView(time: Date(), imageName: "IMG_002", deviceName: "Apple iPhone 12 Pro", imageExtension: "Hief", cameraMode: "Front Camera", cameraAperture: 23, cameraFocalLength: 2.2, iso: 40, cameraMP: 12, imageHeight: 4032, imageWidth: 3024, imageSize: 2.3, imageEV: 0, cameraShutterSpeed: 124, longitude: Int32(-116.166_868), latitude: Int32(34.011_286), location: "Delhi, India",  dismiss: { self.showMapSetting = false })
                }
                .navigationBarTitle("Bottom Sheet")
                .navigationBarItems(
                    leading: Button(action: { self.showMapSetting = true }) { Text("Setting") },
                    trailing: Button(action: { self.showList = true }) { Text("List") }
                )
        }
    }
}

struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
