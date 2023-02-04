//: [Previous](@previous)

import Foundation


var a = 1

// Implicitly unwrapped optional
// Can contain nil
// XCode doesn't warn us
// Don't need to unwrap
var b:Int! = 10

// Optional
// can contain nil
// XCode warns us that this is an optional
// need to unwrap to get the value
var c:Int? = 12

if b != nil {
    var x = 1 + b
    print(x)
}

if c != nil {
    var x = a + c!
    print(x)
}

// Optional Binding
if let d = c {
    var x = 1 + d
    print(x)
}


struct Person {
    
    var name = "Toby"
    
    func talk() {
        print("Hello")
    }
}

var d:Person? = nil
d?.talk()
d?.name
