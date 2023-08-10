import Foundation

public struct personFile {
    
    var firstName: String
    var lastName: String
    
    public init(name: String, last: String) {
        self.lastName = last
        self.firstName = name
    }
    
    public func fullName() -> String {
        return "\(firstName) \(lastName)"
    }
}


open class classyPerson {
    var first: String
    var last: String
    var occupation: String
    
   public init(one: String, two: String, three: String) {
        self.last = two
        self.first = one
        self.occupation = three
    }
}
