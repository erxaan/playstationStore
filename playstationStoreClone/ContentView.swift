//
//  ContentView.swift
//  playstationStoreClone
//
//  Created by Govorov Erkhaan on 04.07.2021.
//

import SwiftUI

struct Game {
    let title: String
    let image: String
    let percent: Int
    let recieve: Int
    let available: Int
    var progress: CGFloat {
        CGFloat(percent) / 100.0
    }
}
struct Stardew: View {
    let game = Game(title: "Stardew Valley™",
                    image: "stardew",
                    percent: 70,
                    recieve: 28,
                    available: 40)
    let radius: CGFloat = 100
    
    
    var body: some View {
        Spacer()
        
                
                Text("Вы недавно играли")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
                Image(game.image)
                    .resizable()
                    .scaledToFit()
                
                
                VStack {
                    Text(game.title)
                        .font(.largeTitle)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Divider()
                    NavigationLink(destination: Text("Призы")) {
                        HStack {
                            Text("Призы")
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                        .foregroundColor(.white)
                    }
                    HStack(spacing: 50.0) {
                        VStack(spacing: 10) {
                            Text("\(game.recieve)")
                                .font(.title)
                            Text("Получено")
                                .font(.footnote)
                        } // Получено
                        ZStack {
                            Circle()
                                .stroke(Color.gray, lineWidth: 3)
                                .frame(width: radius, height: radius)
                            Circle()
                                .trim(to: game.progress)
                                .stroke(Color.white, style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
                                .frame(width: radius, height: radius)
                                .rotationEffect(Angle(degrees: -90))
                            Text("\(Int(game.percent))%")
                        } // RingView
                        VStack(spacing: 10) {
                            Text("\(game.available)")
                                .font(.title)
                            Text("Доступно")
                                .font(.footnote)
                        } // Доступно
                    }
                    HStack(spacing: 30.0) {
                        Image(systemName: "gamecontroller.fill")
                        Image(systemName: "location.fill")
                        Image(systemName: "bag.fill")
                        Image(systemName: "gearshape.2.fill")
                        Image(systemName: "magnifyingglass")
                    }
                    .font(.largeTitle)
                    .padding(.vertical, 20)
                    NavigationLink(
                        destination: Image("mainmenu")){
                        Text("Играть")
                            .foregroundColor(.white)
                            .font(.title)
                            .underline()
                    }}
                    .padding(.horizontal)
                Spacer()
            }
          
        }



struct Stardew_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Stardew()
                .preferredColorScheme(.dark)
            Stardew()
                .preferredColorScheme(.light)
        }
    }
}
