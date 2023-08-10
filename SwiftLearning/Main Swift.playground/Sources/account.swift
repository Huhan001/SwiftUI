
public protocol Account {
    associatedtype Currency
    
    var balance: Currency { get }
    func deposit(amount: Currency)
    func wihtdraw(amount: Currency)
}

// now adding a conforming type with the code.

public typealias Dollars = Double

open class basicAccount: Account {
    public init() {} // added public 
    
    public private(set) var balance: Dollars = 0.0
    
   public func deposit(amount: Dollars) {
        balance += amount
    }
    
    public func wihtdraw(amount: Dollars) {
        if amount <= balance {
            balance -= amount
        } else {
            balance = 0
        }
    }
}

// with open, the class can be inherited but never can it be changed or overiden. by the main console. but public can be overiden by other subclasses in modules.

// when protocal is passed on. but fullfilled by the one passing it on. then the follow up doesnt need to abide or address all the issues within the protocal.


