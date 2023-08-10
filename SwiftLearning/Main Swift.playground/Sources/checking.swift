import Foundation


public class CheckingAccount: basicAccount {
    // extension by behaviour // page 358
    private var issuedchecks: [Int] = []
    private var currenctCehck = 1
    
    public override init() {} // added public
    
    private let accountnumber = UUID().uuidString
    
    
    public class Check { //💳
        let account: String
        let amount: Dollars
        private(set) var cashed = false
        
        func cash() {
            cashed = true
        }
        
      fileprivate init(amount: Dollars, from account: CheckingAccount){
            self.amount = amount
            self.account = account.accountnumber // accesible by the root class.
        }
    }
    
    public func writeCheck(amount: Dollars) -> Check? {
        guard balance > amount else {
            return nil
        }
        let check = Check(amount: amount, from: self)
        wihtdraw(amount: check.amount)
        return check
    }
    
    public func deposit(_ check: Check) {
        guard !check.cashed else {
            return
        }
        
        deposit(amount: check.amount)
        check.cash()
    }
}

private extension CheckingAccount {
    func inspectforFraud(with Checknumber: Int) -> Bool {
        issuedchecks.contains(Checknumber)
    }
    
    func nextNumber() -> Int {
        let next = currenctCehck
        currenctCehck += 1
        return next
    }
}

// file private allows access to code created within the same entity and not limited to lexicol scope or extensions as is the case with private.
// here i can access the privaet due to extensions. line 48



// extension by conformance
// this follows what i learend from protocals

extension CheckingAccount: CustomStringConvertible {
    public var description: String {
        "cheking balance: $\(balance)"
    }
}
// easily added to the checking without adding major damage to the main code and can easily be removed at no hustle or worry. i think i get it now.
// clean code.


