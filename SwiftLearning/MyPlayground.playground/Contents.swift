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
// static can be accessed and property type and not instance type.

if let url = Bundle.main.url(forResource: excercise.VideoName, withExtension: "mp4") {
  VideoPlayer(player: AVPlayer(url: url))
} else {
  Text("Couldn't find \(excercise.VideoName).mp4")
    .foregroundColor(.red)
}

import AVKit

guard let url = Bundle.main.url(forResource: <#T##String?#>, withExtension: <#T##String?#>) else {
  Text("Couldn't find \(excercise.VideoName).mp4")
    .foregroundColor(.red)
}
VideoPlayer(player: AVPlayer(url: url))


