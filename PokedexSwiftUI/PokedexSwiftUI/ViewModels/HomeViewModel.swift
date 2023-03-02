//
//  HomeViewModel.swift
//  PokedexSwiftUI
//
//  Created by Robert Howard on 2/28/23.
//

import Foundation
import SwiftyJSON

class HomeViewModel: ObservableObject {
    
    @Published var isLoading = true
    @Published var allPokemon = [Pokemon]()
    @Published var errorMessage = ""
    
    init() {
        getAllPokemon()
    }
    
    
    private func getAllPokemon() {
        
        let urlString = "https://pokeapi.co/api/v2/pokemon/?limit=718"
        
        guard let url = URL(string: urlString) else {
            self.isLoading = false
            self.errorMessage = "Error converting urlString to URL: Url String: \(urlString)"
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data else {
                self.isLoading = false
                self.errorMessage = "Error no data found in URLSession"
                return
            }
            
            print(data.debugDescription)
    
            DispatchQueue.main.async {
                
                if let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode >= 400 {
                    self.isLoading = false
                    self.errorMessage = "Bad status: \(statusCode)"
                    return
                }
                
                do {
                    
                    let json = try JSON(data: data)
                    self.allPokemon = self.parsePokemonSwifty(json: json)
                    
                } catch {
                    
                    print("Failed to decode JSON: ", error)
                    self.errorMessage = error.localizedDescription
                    
                }
                
                self.isLoading = false
                
            }
            
            
        }.resume()
        
        
    }
    
    private func parsePokemonSwifty(json: JSON) -> [Pokemon] {
        var allPokemon = [Pokemon]()
        //Pulling out the information from the json array and creating the array of all Pokemon
        for (index , object) in json["results"] {
            allPokemon.append(Pokemon(id: Int(index)! + 1, name: object["name"].stringValue, url: object["url"].stringValue))
        }
        //print(allPokemon)
        return allPokemon
    }
    
}
