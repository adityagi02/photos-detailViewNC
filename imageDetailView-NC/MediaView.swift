//
//  MediaView.swift
//  imageDetailView-NC
//
//  Created by Aditya Tyagi on 21/10/23.
//

import SwiftUI

struct MediaView: View {
    var body: some View {
        VStack{
            media().body
               
        }
        .ignoresSafeArea()
    }
}

struct MediaView_Previews: PreviewProvider {
    static var previews: some View {
        MediaView()
    }
}


struct media : View {
    var body: some View {
        GeometryReader { geometry in
            Image("testImage")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: geometry.size.width, height: geometry.size.height)
                //.background(.red)
        }
    }
}
