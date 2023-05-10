//
//  ExcerciseView.swift
//  my first
//
//  Created by Humphrey Hanson on 06.05.23.
//

import SwiftUI

import AVKit // AVKit lets you use high-level types like AVPlayer to play videos with the usual playback controls.


struct ExcerciseView: View {
// let videoNames = ["squat", "step-up", "burpee", "sun-salute"]
// let exerciseNames = ["Squat", "Step Up", "Burpee", "Sun Salute"]
  
  let index: Int
  
  var excercise: Exercise {
    Exercise.exercises[index]
  } // computed property. 
  
  var body: some View {
    //GeometryReader { geometry in
      VStack{
        HeaDviews(exerciseNames: excercise.exerciseName)
          
        if let url = Bundle.main.url(
          forResource: excercise.videoName,withExtension: "mp4") {
          VideoPlayer(player: AVPlayer(url: url))
          //  .frame(height: geometry.size.height * 0.45)
        } else {
          Text("Couldn't find \(excercise.videoName).mp4")
            .foregroundColor(.red)
        }
        
        Text("Timer")
        Text("Start/Done button")
        Text("Rating")
        Text("History")
        }
       //}
      }
    }

struct ExcerciseView_Previews: PreviewProvider {
    static var previews: some View {
      ExcerciseView(index: 0)
    }
}


