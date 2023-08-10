import SwiftUI
import UIKit


func greet(name: String) -> NSAttributedString {
    let attributes = [NSAttributedString.Key.foregroundColor: UIColor.blue]
    let message = NSAttributedString(string: "Hello " + name, attributes: attributes)
    return message
}

greet(name: "Hanson")

func greetings(name: String) -> NSAttributedString {
    let message = NSMutableAttributedString()
    message.append(NSAttributedString(string: "Hello ", attributes: [NSAttributedString.Key.foregroundColor:UIColor.green]))
    let attributes = [NSAttributedString.Key.foregroundColor: UIColor.blue]
    message.append(NSAttributedString(string: name, attributes:
    attributes))
    return message
}

greetings(name: "Jonathan")

func BracketMessage(name: String) -> NSAttributedString {
    let attributes = [NSAttributedString.Key.foregroundColor:UIColor.red, NSAttributedString.Key.font:UIFont.systemFont(ofSize: 16),
                      NSAttributedString.Key.backgroundColor:UIColor.green]
    let message = NSAttributedString(string: name, attributes: attributes)
    return message
}

BracketMessage(name: "Hanson Humphey")

func fristNameAndLast(name: String, detail: String) -> NSAttributedString {
    let attributed = [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 12), NSAttributedString.Key.foregroundColor:UIColor.brown]
    let message = NSMutableAttributedString(string: name, attributes: [NSAttributedString.Key.shadow:UIColor.purple,NSAttributedString.Key.backgroundColor:UIColor.red])
    message.append(NSAttributedString(string: detail, attributes: attributed))
    return message
}

fristNameAndLast(name: "Humphrey ", detail: "trying to learn this new Trick")

// enter result builders, that code was somewhat messy.
//func greatHello(name: String) -> NSAttributedString {
//    NSAttributedString(string: "Hello ")
//    NSAttributedString(string: name , attributes: [NSAttributedString.Key.foregroundColor:UIColor.orange])
//    NSAttributedString(string: " Mother of Movies", attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 15)])
//}

//greatHello(name: "OPION")


@resultBuilder
enum AttributedStringBuilder {
    static func buildBlock(_ components: NSAttributedString...) -> NSAttributedString {
        let attributedString = NSMutableAttributedString()
        for component in components {
            attributedString.append(component)
        }
        return attributedString
    }
}

@AttributedStringBuilder
func greetbulder(name: String) -> NSAttributedString {
    NSMutableAttributedString(string: "Hello ", attributes: [NSAttributedString.Key.foregroundColor:UIColor.orange])
    NSMutableAttributedString(string:  name, attributes: [NSAttributedString.Key.foregroundColor:UIColor.red])
    NSMutableAttributedString(string: ", mother of flowers", attributes: [NSAttributedString.Key.foregroundColor:UIColor.lightGray])
}

greetbulder(name: "denareys")


// -------------------------------------
// using type allias

typealias text = NSMutableAttributedString

@resultBuilder
enum stringBuilder {
    static func buildBlock(_ components: NSAttributedString...) -> NSAttributedString {
        let something = text() // do not forget to add ()
        for component in components {
            something.append(component)
        }
        return something
    }
}

@stringBuilder
func helloInDifferentColours(name: String,last: String, age: Int, occupation: String) -> NSAttributedString {
    text(string: name , attributes: [NSAttributedString.Key.foregroundColor:UIColor.red])
    text(string: last , attributes: [NSAttributedString.Key.foregroundColor:UIColor.lightGray])
    text(string: occupation , attributes: [NSAttributedString.Key.shadow:UIColor.brown])
    text(string: " \(age)", attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 14), NSAttributedString.Key.backgroundColor:UIColor.orange])
    
    // no need to add a a return
}

helloInDifferentColours(name: "Humphrey ",last: "Hanson ", age: 29, occupation: " Data Science ")


// chapter 21.. pattern Matching.
