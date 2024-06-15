//
//  Music.swift
//  Aula06
//
//  Created by Turma02-8 on 12/06/24.
//

import SwiftUI

struct Music: View {
    @State var item: Song = Song(id:1, name:"Hacka Song", artist:"Hacka Truck", capa:"https://www.eldorado.org.br/wp-content/uploads/2017/07/Hackatruck_040717.jpg")
    @State private var wasClicked = false
    @State private var button: String = "play.fill"
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.black, Color.blue]), startPoint: .bottom, endPoint: .top)
                .ignoresSafeArea()
            VStack{
                Spacer()
                AsyncImage(url: URL(string: item.capa)) { image in
                    image
                        .resizable()
                        .frame(width: 300, height:300)
                } placeholder: {
                    Color.red
                    .frame(width: 300, height:300)
                }
                Text(item.name)
                    .font(.title)
                    .foregroundColor(.white)
                Text(item.artist)
                    .foregroundColor(.white)
                HStack{
                    Image(systemName: "shuffle")
                        .foregroundColor(.white)
                        .padding(.top, 60)
                        .font(.system(size: 40))
                    Image(systemName: "backward.end.fill")
                        .foregroundColor(.white)
                        .padding(.top, 60)
                        .font(.system(size: 40))
                    Button{
                        wasClicked.toggle()
                        if wasClicked{
                            button = "pause.fill"
                        }else{
                            button = "play.fill"
                        }
                    }label: {
                        Image(systemName: button)
                            .foregroundColor(.white)
                            .padding(.top, 60)
                            .font(.system(size: 40))
                    }
                    Image(systemName: "forward.end.fill")
                        .foregroundColor(.white)
                        .padding(.top, 60)
                        .font(.system(size: 40))
                    Image(systemName: "repeat")
                        .foregroundColor(.white)
                        .padding(.top, 60)
                        .font(.system(size: 40))
                }//Hstack 1
                Spacer()
            }//VStack 1
        }//ZStack 1
    }
}

#Preview {
    Music(item: Song(id:1, name:"Hacka Song", artist:"Hacka Truck", capa:"https://www.eldorado.org.br/wp-content/uploads/2017/07/Hackatruck_040717.jpg"))
}
