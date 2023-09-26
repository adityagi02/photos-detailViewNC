//
// PatientPage.swift
// burst-ui
//
// Created by Shubham Lahoti on 25/09/23.
//
import SwiftUI

struct PatientPage: View {
  let columns: [GridItem] = [
    GridItem(.flexible(), spacing: nil, alignment: nil),
    GridItem(.flexible(), spacing: nil, alignment: nil),
    GridItem(.flexible(), spacing: nil, alignment: nil)
  ]
  var body: some View {
    VStack(spacing: 0){
      HStack(){
        Spacer().frame(width: 10)
        ColumnData(title: "History", desc: "Jan 6 2023")
        Spacer()
        Divider().frame(height: 50)
        ColumnData(title: "Name", desc: "Oliva R.")
        Spacer()
        Divider().frame(height: 50)
        ColumnData(title: "Last date", desc: "Jan 6 2023")
        Spacer()
      }
      Divider()
      Button {
      } label: {
        Text("Hello")
          .foregroundColor(.indigo)
          .frame(maxWidth: .infinity, maxHeight: 10)
          .font(.headline)
          .fontWeight(.semibold)
          .padding()
          .background(
            Color.white
            .cornerRadius(10)
          )
      }
      .padding()
    }
    .background(Color.yellow)
    .cornerRadius(10)
    .padding(.horizontal)
  }
}


struct ColumnData: View {
  var title: String
  var desc: String
  var body: some View {
    VStack(alignment: .leading){
      Text(title).font(.system(.subheadline, weight: .bold))
      Text(desc).font(.footnote)
    }
  }
}
struct PatientPage_Previews: PreviewProvider {
  static var previews: some View {
    PatientPage()
      .previewLayout(.sizeThatFits)
  }
}
