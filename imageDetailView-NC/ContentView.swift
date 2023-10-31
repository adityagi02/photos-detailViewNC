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
    @State private var orientation = UIDeviceOrientation.unknown
    
    var body: some View {
//        NavigationView {
        ZStack(alignment: .bottom){
                VStack{
                    HStack(alignment: .center){
                        Spacer()
                        Text("IMG_001")
                            .padding(.trailing, 85)
                        navigationBar
                            .padding(.trailing, 15)
                    }
                    MediaView()
                    Spacer()
                }
                if showMapSetting {
                    MediaView()
                    mediaDetailView(time: Date(), imageName: "IMG_002", deviceName: "Apple iPhone 12 Pro", imageExtension: "Hief", cameraMode: "Front Camera", apertureValue: 23, lensLength: 2.2, iso: 40, megaPixels: 12, height: 4032, width: 3024, imageSize: 2.3, exposureValue: 0, shutterSpeedApex: 124, longitude: Int32(-116.166_868), latitude: Int32(34.011_286), location: "Delhi, India",  dismiss: { self.showMapSetting = false })
                        .frame(height: 450)
                    
                        .transition(.move(edge: .bottom))
                        .animation(.spring(), value: showMapSetting)
                        .background(.background)
                        //.cornerRadius(12)
                }
                
            }
        
    }
    
    
    @ViewBuilder
    var navBar : some View {
        HStack{
            Image(systemName: showMapSetting == false ? "info.circle" : "info.circle.fill")
                .resizable()
                .frame(width: 20, height: 20)
//                .foregroundColor(.black)
                .listStyle(PlainListStyle())
        }
    }
    
    
    @ViewBuilder
    var navigationBar : some View {
        HStack(spacing: 10) {
            
            Button(action: {
                withAnimation(.spring()){
                    self.showMapSetting = !showMapSetting
                }
                
            }) {
                navBar
            }
            
            Button(action: {
                // Action for the second button -> Open Menu Sheet
            }) {
                Image(systemName: "ellipsis.circle")
                .resizable()
                .frame(width: 20, height: 20)
//                    .foregroundColor(.black)
            }
            
        }.padding(.trailing, 8)
    }
}

struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


extension View {
    /// Applies the given transform if the given condition evaluates to `true`.
    /// - Parameters:
    ///   - condition: The condition to evaluate.
    ///   - transform: The transform to apply to the source `View`.
    /// - Returns: Either the original `View` or the modified `View` if the condition is `true`.
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}


// Our custom view modifier to track rotation and
// call our action
struct DeviceRotationViewModifier: ViewModifier {
    let action: (UIDeviceOrientation) -> Void

    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                action(UIDevice.current.orientation)
            }
    }
}

// A View wrapper to make the modifier easier to use
extension View {
    func onRotate(perform action: @escaping (UIDeviceOrientation) -> Void) -> some View {
        self.modifier(DeviceRotationViewModifier(action: action))
    }
}
