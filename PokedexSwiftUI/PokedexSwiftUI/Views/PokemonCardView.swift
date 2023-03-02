//
//  PokemonCardView.swift
//  PokedexSwiftUI
//
//  Created by Robert Howard on 3/1/23.
//

import SwiftUI

struct PokemonCardView: View {
    
    let pokemon: Pokemon
    
    var body: some View {
        
        ZStack {
            
            Color(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .foregroundColor(Color("background"))
                )
                .offset(y: 60)
            VStack(alignment: .center, spacing: 0) {
                HStack {
                    Spacer()
                    Text("#\(pokemon.id)")
                        .font(.system(size: 12, weight: .regular))
                        .foregroundColor(Color(.systemGray))
                }
                
                VStack(spacing: 8.0) {
                    Image("\(pokemon.id)")
                        .resizable()
                        .scaledToFill()
                    .frame(width: 60, height: 60)
                    
                    
                    Text("\(pokemon.name.capitalized)")
                        .font(.system(size: 14, weight: .light))
                }
                

            }.padding(.horizontal, 8)
                .padding(.vertical, 8)
        
    }
            .background(Color.white)
            .cornerRadius(8)
            .shadow(radius: 6, x: 2, y: 6)
    }
}

struct PokemonCardView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCardView(pokemon: Pokemon(id: 1, name: "bulb", url: ""))
            .previewLayout(.sizeThatFits)
    }
}
