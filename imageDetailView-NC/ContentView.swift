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
        NavigationView {
            VStack{
                MediaView()
                
                VStack{
//
//                    Button(action: {
//                        self.showMapSetting = !showMapSetting
//                    }, label: {
//                        // Image(systemName: showMapSetting ? "info.fill" : "info" )
//                        Text("Details")
//                    })
//                    //                    .navigationBarTitle("Bottom Sheet")
//                    .navigationBarItems(
//                        leading: Button(action: { self.showMapSetting = true }) { Text("Setting") },
//                        trailing: Button(action: { self.showList = true }) { Text("List") }
//                    )
                }
            }.navigationBarTitle("IMG_002", displayMode: .inline)
                .navigationBarItems(trailing:
                                        HStack {
                    Button(action: {
                        self.showMapSetting = !showMapSetting
                    }) {
                        Image(showMapSetting == false ? "ellipsis.circle" : "ellipsis.circle.fill")
                            .resizable()
                            .frame(width: 12)
                            .foregroundColor(.black)
                            .listStyle(PlainListStyle())
                            .bottomSheet(
                                isPresented: $showMapSetting,
                                height: 450,
                                topBarHeight: 16,
                                topBarCornerRadius: 16,
                                showTopIndicator: false
                            ) {
                                mediaDetailView(time: Date(), imageName: "IMG_002", deviceName: "Apple iPhone 12 Pro", imageExtension: "Hief", cameraMode: "Front Camera", apertureValue: 23, lensLength: 2.2, iso: 40, megaPixels: 12, height: 4032, width: 3024, imageSize: 2.3, exposureValue: 0, shutterSpeedApex: 124, longitude: Int32(-116.166_868), latitude: Int32(34.011_286), location: "Delhi, India",  dismiss: { self.showMapSetting = false })
                            }

                    }
                    Button(action: {
                        // Action for the second button
                    }) {
                        Image("info.circle")
                            .resizable()
                            .frame(width: 12)
                            .foregroundColor(.black)
                    }
                }.padding()
                )
        }
    }
}

struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
