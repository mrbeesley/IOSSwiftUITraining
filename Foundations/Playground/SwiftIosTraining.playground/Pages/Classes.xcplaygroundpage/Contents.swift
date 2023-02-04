//: [Previous](@previous)

import Foundation

// Use the final keyword before class to "seal" the class and make it not inheritable
class Person {
    var name = ""
    
    func talk() {
        print("Make Conversation")
    }
}

class Comedian : Person {
    override func talk() {
        print("Make people laugh")
        
        super.talk()
    }
}

var c = Comedian()
c.talk()

// Value vs Reference Types

struct TalkShowHost {
    var name = ""
}

//func changeName(p:TalkShowHost) {
////    p.name = "Bob" // Can't do this since p is immutable
//    var c = p
//    c.name = "Bob"
//}
func changeName(p:Comedian) {
    p.name = "Bob"
}

var a = TalkShowHost()
a.name = "Joe"
var b = a
b.name = "Ted"

// Structsa are value types (immutable)
print("Variable A Name is: \(a.name)")
print("Variable B Name is: \(b.name)")

var e = Comedian()
e.name = "Chris"
var f = e
f.name = "David"
print("Variable E Name is : \(e.name)")
print("Variable F Name is : \(f.name)")

changeName(p: f)

print("After Name Change Variable E Name is : \(e.name)")
print("After Name Change Variable F Name is : \(f.name)")

/*
 When to use Struct vs Class
 1. structs are lighter weight, used for views and UI components
 2. structs are better for modeling data
 3. structs are passed as copies (value) and class are passed by reference
 */

