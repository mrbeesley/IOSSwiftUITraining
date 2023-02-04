//
//  BusinessSearch.swift
//  CitySightsApp
//
//  Created by Michael Beesley on 2/1/23.
//

import Foundation

struct BusinessSearch: Decodable {
    var businesses = [Business]()
    var total = 0
    var region = Region()
}
