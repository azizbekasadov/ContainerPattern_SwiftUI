//
//  API.swift
//  ContainerPattern_SwiftUI
//
//  Created by Azizbek Asadov on 21/01/23.
//

import Foundation

public final class API {
    fileprivate static let urlString: String = "https://api.escuelajs.co/api/v1/products"
    
    public func getAllProducts() async throws -> [Product] {
        guard let url = URL(string: API.urlString) else {
            fatalError("URL is incorrect")
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        return try JSONDecoder().decode([Product].self, from: data).sorted(by: <)
    }
    
    public init() {}
}
