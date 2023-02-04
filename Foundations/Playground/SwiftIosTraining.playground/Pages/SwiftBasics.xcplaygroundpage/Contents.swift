import UIKit

// former variable declaration
var myVar:String = "hello"
myVar += " world"
print(myVar)

// formal variable declaration
var myInt:Int = 100
print(myInt)

// shorthand varable delaration
var anotherInt = 200
print(anotherInt)

// example of a constant
let constantString:String = "Doesn't Change"
print(constantString)


// example of a function
func myFunc() {
    let a = 10
    let b = 20
    print(a+b)
}
myFunc()

// example of a function with input params
func add(a:Int, b:Int) -> Int {
    return a+b
}
print(add(a:10,b:20))
print(add(a:5,b:10))

// If you use an underscore you don't have to call with argument labels
func addWithLabels(firstNumber a:Int, secondNumber b:Int) -> Int {
    return a+b
}
print(addWithLabels(firstNumber: 7, secondNumber: 6))
