//
//  AstronautView.swift
//  Moonshot
//
//  Created by Мирсаит Сабирзянов on 12.11.2023.
//

import SwiftUI

struct AstronautView: View {
    
    let astronaut: Astronaut
    
    var body: some View {
        ScrollView{
            VStack{
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                    .padding()
                    .containerRelativeFrame(.horizontal){
                        width, axis in width * 0.9
                    }
                
                Text(astronaut.description)
                    .padding(.horizontal)
                    .font(.headline)
            }
        }
        .background(.darkBackground)
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

#Preview {
    let astronaut: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    return AstronautView(astronaut: astronaut["aldrin"]!)
        .preferredColorScheme(.dark)
}
