//: [Previous](@previous)

import Foundation

// For - In
//for index in 1...10 {
//    print("Hello: \(index)")
//}
var array:[Int] = [1,5,10]
/*
for index in 0...array.count-1 {
    print("Array Value at position \(index) is \(array[index])")
}
*/
//for item in array {
//    print("Array value: \(item)")
//}


// Repeat While
var repeatCounter = 10
repeat {
    print("Repeat Loop - Counter is: \(repeatCounter)")
    repeatCounter-=1
} while repeatCounter > 0


// While
var whileCounter = 10
while whileCounter > 0 {
    print("While Loop - Counter is: \(whileCounter)")
    whileCounter-=1
}
