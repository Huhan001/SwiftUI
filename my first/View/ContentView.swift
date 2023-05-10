//
//  ContentView.swift
//  my first
//
//  Created by Humphrey Hanson on 05.05.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            TabView {
              ForEach(Excercise.excercise.indices, id: \.self) { one in
                ExcerciseView(index: one) }
          }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView()
    }
}
