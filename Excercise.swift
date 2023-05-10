//
//  Excercise.swift
//  my first
//
//  Created by Humphrey Hanson on 09.05.23.
//

import Foundation

struct Excercise {
  let ExcersideName: String
  let VideoName: String
  
  enum ExcerciseEnum: String {
    case squat = "Squat"
        case stepUp = "Step Up"
        case burpee = "Burpee"
        case sunSalute = "Sun Salute"
  }
}

extension Excercise {
  static let excercise = [
    Excercise(ExcersideName: ExcerciseEnum.squat.rawValue, VideoName: "Squat"),
    Excercise(ExcersideName: ExcerciseEnum.stepUp.rawValue, VideoName: "step Up"),
    Excercise(ExcersideName: ExcerciseEnum.burpee.rawValue, VideoName: "Burpee"),
    Self.init(ExcersideName: ExcerciseEnum.sunSalute.rawValue, VideoName: "Sun Salute") // or you can use Self.
  ]
}
