//: [Previous](@previous)

import Foundation

//var a:[String:String] = [String:String]()
var a = [String:String]()

// Add a value
a["J183"] = "Chris Ching"

// Update a value
a["J183"] = "Todd Cho"

// Remove a value
a["J183"] = nil


// Declaring a dictionary initialized to key value pairs
var b = ["j83":"Chris Ching", "J84":"John Cho"]

for kvp in b {
    print("key is: " + kvp.key)
    print("value is: " + kvp.value)
}

for (key, value) in b {
    print("key is: " + key)
    print("value is: " + value)
}

// Tuple
var c:(String, String) = ("Hey", "There")

// accessing values on a tuple is index based
print(c.0)
print(c.1)
