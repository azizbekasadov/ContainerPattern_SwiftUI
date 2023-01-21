//
//  ContentView.swift
//  ContainerPattern_SwiftUI
//
//  Created by Azizbek Asadov on 21/01/23.
//

import SwiftUI

// MARK: - PresenterView

struct ProductListView: View {
    var products: [Product]
    
    var body: some View {
        List(products) {
            Text($0.title)
        }
        .accessibilityLabel("Product ListView")
    }
}

// MARK: - ContentView
struct ContentView: View {
    @State private var products: [Product] = []
    
    var body: some View {
        ProductListView(products: products)
            .task {
                do {
                    self.products = try await API().getAllProducts()
                } catch {
                    print(error.localizedDescription)
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
