//: [Previous](@previous)

import Foundation

var myNum:Int = 10
var mySecondArray:[Int] = [10, 100, 1000]
var myArray:[Int] = [Int]()

myArray.append(10)
myArray.append(100)
myArray.append(1000)

print(myArray)
print(myArray[0])

//update elements in an array
myArray[0] = 1
print(myArray)

myArray.remove(at: 1)
print(myArray)

myArray.insert(10, at: 0)
myArray.append(100)
print(myArray)

print(myArray.first)
print(myArray.last)
print(myArray.count)
print(myArray.contains(10))
print(myArray.firstIndex(of: 100))
