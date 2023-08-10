// generic protocols

import Foundation

protocol Product {
    init()
    // Product now includes init(), so the production line can create new products without having to know the concrete type of that product.
}

protocol ProductionLine {
    associatedtype ProductType
    func produce() -> ProductType
}

protocol Factory {
    associatedtype ProductType
    func produce() -> [ProductType]
}

protocol Warehouse {
    associatedtype producedThings
    func produce() -> [producedThings]
}
// ------------------------------------------
struct Car: Product {
    init() {
        print("Producing one awesome Car 🚖")
    }
}

struct Chocolate: Product {
    init(){
        print("Producing one chocolate bar 🍫")
    }
}
// -------------------------------------------

// Instead of creating specific production lines and factories for cars and chocolates, you can create a single, generic production line and factory:
struct GenericProductionLine<P: Product>: ProductionLine {
    func produce() -> P {
        P()
    }
}

struct GenericFactory<P:Product>: Factory {
    var productionLines: [GenericProductionLine<P>] = []
    
    func produce() -> [P] {
        var newItems: [P] = []
        productionLines.forEach { newItems.append($0.produce())}
        print("Finished Production")
        print("-------------------")
        return newItems
    }
}
var carFactory = GenericFactory<Car>()
carFactory.productionLines = [GenericProductionLine<Car>(),GenericProductionLine<Car>()]
carFactory.produce()


// ----------- Excercise
struct GenericWarehouse<P:Product>: Warehouse {
    var productionLines: [GenericProductionLine<P>] = []
    
    func produce() -> [P] {
        var store: [P] = []
        productionLines.forEach {store.append($0.produce())}
        return store
    }
}

var chocoFactory = GenericWarehouse<Chocolate>()
chocoFactory.productionLines = [GenericProductionLine(), GenericProductionLine(), GenericProductionLine()]
chocoFactory.produce()
chocoFactory.productionLines



// testing Generics
func talktomelady<P>(_ one: P) -> P {
    return one
}

talktomelady("Hello Sam i Daniels ! 89")
talktomelady(34)
talktomelady(45.6)
talktomelady(true)


// opaque return types { with the WORD SOME }
func david() -> some Numeric { // works somehow.
    return 89.3
}

func savanah() -> some Equatable {
    return true
}

// excercise.

/// • A train has 75 Pieces.
/// • A train robot can assemble 500 pieces per minute.
/// • Use an opaque return type to hide the type of robot you return.
func robot(_ some: Int) -> some Numeric {
    var efficiency = 500
    var timelapsed = 60
    var time = efficiency / timelapsed
    
    return Double(some / time)
}
// off to concurrency.
// enter concurrency.

import SwiftUI // ⚠️
//Task {
//    print("doing some work on task")
//}
//print("doing some work on main actor")



print("-------------------")
// challange order
//Task {
//    print("Doing some work on a task")
//    let sum = (1...100).reduce(0, +)
//    print("1 + 2 + 3 ... 100  = \(sum)")
//}
//print("doing some work on main actor")

// And herein lies the fundamental challenge with concurrent programming: The order of events can change depending on the input size, processing power or how the operating system scheduler decides to schedule tasks to work on.


// cancelling a task.
let task = Task {
  print("Doing some work on a task")
  let sum = (1...5000).reduce(0, +)
  try Task.checkCancellation()
  print("1 + 2 + 3 ... 100 = \(sum)")
}
print("Doing some work on the main actor")
task.cancel()

// now it works are the text book. all depending on the computational size. but this cannot be relied upon all the time.
// coorperative cancellation.

// suspending a task.
Task {
    print("Humphrey Hanson")
    // await makes it wait which is to achieve what we want. but try must be there.
    // same as with errors.
    try await Task.sleep(nanoseconds: 1_000)
    print("Is Going Places")
}

// wrapping it all into a function

func SaySomethingToEm() async throws {
    print("Humphrey Hanson")
    // await makes it wait which is to achieve what we want. but try must be there.
    // same as with errors.
    try await Task.sleep(nanoseconds: 1_000_000_000)
    // any function that has must have a throw. period.
    // and this cas async
    print("Is Going Places")
}

Task {
   try await SaySomethingToEm()
    // also you must use it out here with its full glory.
    // await and try.
    // musch like within the funciton itself. whrapped around task.
}


// fetching the API
struct Domains: Decodable { // 1
    let data: [Domain]
}

struct Domain: Decodable {
    let attribute: Attributes
}

struct Attributes: Decodable {
    let name: String
    let description: String
    let level: String
}

func fetchDomains() async throws -> [Domain] {
    // it states that this is a long process.
    // that it can suspend and also throw an error if it is not succesful.
    
    let url = URL(string: "https://api.raywenderlich.com/api/domains")!
    // 1
    let (data, _) = try await URLSession.shared.data(from: url)
    // 2
    return try JSONDecoder().decode(Domains.self, from: data).data
                
}

// to test it out.
Task {
    do {
        let domains = try await fetchDomains()
        for domain in domains {
            let attr = domain.attribute
            print("\(attr.name): \(attr.description) - \(attr.level)")
        }
    } catch {
        print(error)
    }
}

// Asynchronous sequences.

func findTittle(url: URL) async throws -> String? {
    for try await line in url.lines {
        if line.contains("<title>") {
            return line.trimmingCharacters(in: .whitespaces)
        }
    }
    return nil
}

Task {
    if let tittle = try await findTittle(url:URL(string: "https://www.kodeco.com/home")!) {
        print(tittle)
    }
}

// suppose i want to get the tittle to the web pages.
func findingTitleSerial(first: URL, second: URL) async throws -> (String?, String?) {
    async let tittle1 = try await findTittle(url: first)
    async let title2 = try await findTittle(url: second)
    let headings = try await [tittle1, title2]
    return(headings[0], headings[1])
}

// asynchonous properties and subscripts
// you can also incorporate async with computed properties.
extension Domains {
    static var domains: [Domain] {
        get async throws {
            try await fetchDomains()
        }
    }
}

// i can test it with dump.

Task {
    dump(try await Domains.domains)
}

// Thank you Grace.
// In Jesus Christ name. 
