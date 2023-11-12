//
//  ContentView.swift
//  Moonshot
//
//  Created by Мирсаит Сабирзянов on 12.11.2023.
//

import SwiftUI

struct Cards: View{
    let missinons: [Mission]
    let astronauts: [String: Astronaut]

    var body: some View{
        ForEach(missinons){ mission in
            NavigationLink{
                MissionView(mission: mission, astronauts: astronauts)
            } label: {
                VStack{
                    Image(mission.image)
                        
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .padding()
                    VStack{
                        Text(mission.displayName)
                            .font(.headline)
                            .foregroundStyle(.white)
                        Text(mission.formatedLounchDate)
                    }
                    .foregroundStyle(.white)
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                    .background(.lightBackground)
                    
                }
                .clipShape(.rect(cornerRadius: 10))
                .overlay{
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.lightBackground)
                }
            }
        }
    }
}

struct ContentView: View {
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missinons: [Mission] = Bundle.main.decode("missions.json")
    let columns = [ GridItem(.adaptive(minimum: 150))]
    
    @State private var mode = "List"
    @State private var isGrid = true
    
    var body: some View {
        NavigationStack{
            ScrollView{
                if isGrid{
                    LazyVGrid(columns: columns){
                        Cards(missinons: missinons, astronauts: astronauts)
                    }
                    .padding([.horizontal, .vertical])
                }
                else{
                    VStack{
                        Cards(missinons: missinons, astronauts: astronauts)
                    }
                    .padding([.horizontal, .vertical])
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar{
                Button("\(mode)"){
                    isGrid.toggle()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
