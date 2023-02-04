//
//  Mocks.swift
//  CitySightsApp
//
//  Created by Michael Beesley on 2/3/23.
//

import Foundation

struct Mocks {
    
    static func GetBusiness() -> Business {
        let business = Business()
        business.name = "Bella Napoli"
        business.coordinates = GetCoordinate()
        business.location = GetLocation()
        business.rating = 4.5
        business.displayPhone = "1-816-444-5041"
        business.phone = "+18164445041"
        
        return business
    }
    
    static func GetCoordinate() -> Coordinate {
        return Coordinate(latitude: 39.014432, longitude: -94.590984)
    }
    
    static func GetLocation() -> Location {
        
        var location = Location()
        location.address1 = "6229 Brookside Blvd"
        location.address2 = ""
        location.address3 = ""
        location.city = "Kansas City"
        location.state = "MO"
        location.country = "US"
        location.zipCode = "64113"
        location.displayAddress = ["6229 Brookside Blvd", "Kansas City, MO 64113"]
        return location
    }
}
