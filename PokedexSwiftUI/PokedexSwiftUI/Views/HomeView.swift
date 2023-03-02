//
//  HomeView.swift
//  PokedexSwiftUI
//
//  Created by Robert Howard on 2/28/23.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject private var homeVM = HomeViewModel()
    
    let columns = [GridItem(.adaptive(minimum: 100))]
    
    var body: some View {
        NavigationView {
            ScrollView {
                if !homeVM.errorMessage.isEmpty {
                    Text("\(homeVM.errorMessage)")
                }
                LazyVGrid(columns: columns, spacing: 8) {
                    ForEach(homeVM.allPokemon, id: \.self) { pokemon in
                        NavigationLink(destination: Text("Details")) {
                            PokemonCardView(pokemon: pokemon)
                        }.foregroundColor(Color(.label))
                        
                    }
                }.padding(.horizontal, 16)
            }.background(Color("background"))
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
