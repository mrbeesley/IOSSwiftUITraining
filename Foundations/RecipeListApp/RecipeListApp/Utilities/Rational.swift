//
//  Rational.swift
//  RecipeListApp
//
//  Created by Michael Beesley on 1/12/23.
//

import Foundation

struct Rational {
    static func greatesCommonDivisor(_ a:Int, _ b: Int) -> Int {
        // GCD(0, b) = b
        if a == 0 {return b}
        
        // GCD(a, 0) = a
        if b == 0 {return a}
        
        // otherwise, GCD(a,b) = GCD(b, remainder)
        return greatesCommonDivisor(b, a%b)
    }
}
