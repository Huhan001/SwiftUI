//
//  HeaderView.swift
//  my first
//
//  Created by Humphrey Hanson on 08.05.23.
//

import SwiftUI

struct HeaDviews: View {
  var exerciseNames: String
  var body: some View {
    VStack{
      Text(exerciseNames)
        .font(.largeTitle)
      HStack{
        Image(systemName: "1.circle")
        Image(systemName: "2.circle")
        Image(systemName: "3.circle")
        Image(systemName: "4.circle")
        Image(systemName: "5.circle")
      }
      .font(.title2)
    }
  }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
      HeaDviews(exerciseNames: "Sqaut")
        .previewLayout(.sizeThatFits)
    }
}
