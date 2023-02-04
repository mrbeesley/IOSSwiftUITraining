//
//  ContentView.swift
//  WarCardGame
//
//  Created by Michael Beesley on 9/14/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var playerCard:String = "card5"
    @State private var cpuCard:String = "card9"
    @State private var playerScore:Int = 0
    @State private var cpuScore:Int = 0
    
    
    var body: some View {
        ZStack {
            Image("background")
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Image("logo")
                Spacer()
                HStack{
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                Button{
                    
                    // Generate a rand number betwee 2 & 14
                    let playerRand = Int.random(in: 2...14)
                    let cpuRand = Int.random(in: 2...14)
                    
                    // Update the cards
                    playerCard = "card" + String(playerRand)
                    cpuCard = "card" + String(cpuRand)
                    
                    // Update the scores
                    if (playerRand > cpuRand) {
                        playerScore += 1
                    } else if cpuRand > playerRand {
                        cpuScore += 1
                    }
                    
                    
                } label: {
                    Image("dealbutton")
                }
                Spacer()
                HStack {
                    Spacer()
                    VStack {
                        Text("Player")
                            .foregroundColor(Color.white)
                            .font(.title)
                            .padding(.bottom, 10)
                        Text(String(playerScore))
                            .foregroundColor(Color.white)
                            .font(.largeTitle)
                    }
                    Spacer()
                    VStack {
                        Text("CPU")
                            .foregroundColor(Color.white)
                            .font(.title)
                            .padding(.bottom, 10)
                        Text(String(cpuScore))
                            .foregroundColor(Color.white)
                            .font(.largeTitle)
                    }
                    Spacer()
                }
                Spacer()
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
