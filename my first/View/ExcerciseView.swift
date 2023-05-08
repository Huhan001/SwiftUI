//
//  ExcerciseView.swift
//  my first
//
//  Created by Humphrey Hanson on 06.05.23.
//

import SwiftUI

struct ExcerciseView: View {
  let videoNames = ["squat", "step-up", "burpee", "sun-salute"]
  let exerciseNames = ["Squat", "Step Up", "Burpee", "Sun Salute"]
  let index: Int
    var body: some View {
      VStack{
        HeaDviews(exerciseNames: exerciseNames[index])
        Text("Video Player")
        Text("Timer")
        Text("Start/Done button")
        Text("Rating")
        Text("History")
      }
    }
}

struct ExcerciseView_Previews: PreviewProvider {
    static var previews: some View {
      ExcerciseView(index: 0)
    }
}


