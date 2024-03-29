//
//  Business.swift
//  CitySightsApp
//
//  Created by Michael Beesley on 2/1/23.
//

import Foundation

class Business : Decodable, Identifiable, ObservableObject {
    
    @Published var imageData: Data?
    
    var id: String?
    var alias: String?
    var name: String?
    var imageUrl: String?
    var isClosed: Bool?
    var url: String?
    var reviewCount: Int?
    var categories: [Category]?
    var rating: Double?
    var coordinates: Coordinate?
    var transactions: [String]?
    var price: String?
    var location: Location?
    var phone: String?
    var displayPhone: String?
    var distance: Double?
    
    enum CodingKeys: String, CodingKey {
        
        case id
        case alias
        case name
        case imageUrl = "image_url"
        case isClosed = "is_closed"
        case url
        case reviewCount = "review_count"
        case categories
        case rating
        case coordinates
        case transactions
        case price
        case location
        case phone
        case displayPhone = "display_phone"
        case distance
        
    }
    
    func getImageData() {
        
        // check that the image url exists
        guard imageUrl != nil else {
            return
        }
        
        // download the data for the image
        if let url = URL(string: imageUrl!) {
            
            let session = URLSession.shared
            let dataTask = session.dataTask(with: url) { (data, response, error) in
                
                if error == nil {
                    DispatchQueue.main.async {
                        self.imageData = data!
                    }
                    
                }
            }
            dataTask.resume()
        }
    }
}
