//
//  Pokemon.swift
//  PokedexSwiftUI
//
//  Created by Robert Howard on 2/28/23.
//

import Foundation

struct Pokemon: Decodable, Hashable {
    let id: Int
    let name: String
    let url: String
}
