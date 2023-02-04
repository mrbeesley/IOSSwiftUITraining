//: [Previous](@previous)

import Foundation

let a = 1
let b = 2
let c = 3
let d = "hello"
let e = false
let f = true
let g = true

if f && g {
    print("And statement was true")
}

if e || f {
    print("Or statement was true")
}

if (f || e) && g {
    print("Combination Or and And statement was true")
} else if g {
    print("Else if statement was true")
} else {
    print("none of the conditions were true")
}

if a == 0 {
    print("a == 0")
}

if a >= 1 {
    print("a >= 1")
}

if a < b {
    print("compare two ints a was less than b")
}
