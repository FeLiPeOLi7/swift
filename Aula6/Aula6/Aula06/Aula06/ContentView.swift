//
//  ContentView.swift
//  Aula06
//
//  Created by Turma02-8 on 12/06/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color.black, Color.blue]), startPoint: .bottom, endPoint: .top)
                    .ignoresSafeArea()
                VStack {
                    AsyncImage(url: URL(string: "https://scontent.fbsb9-1.fna.fbcdn.net/v/t39.30808-6/298538957_489455429848754_8338744740369789501_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=5f2048&_nc_ohc=-7G7GCVDbrQQ7kNvgFSl-1m&_nc_ht=scontent.fbsb9-1.fna&oh=00_AYB2zxwsAiJLXT4oyi6Cn9AEjJrL2Spo6UOkwzIbNYovdw&oe=66700517")) { image in
                        image
                            .resizable()
                    } placeholder: {
                        Color.red
                    }
                    .frame(width: 200, height: 200)
                    HStack{
                        Text("HackaFM")
                            .font(.largeTitle)
                            .padding()
                            .foregroundColor(.white)
                        Spacer()
                    }
                    NavigationLink(destination: Music(item: arrayMusicas[arrayMusicas.count-1])){
                        VStack{
                            HStack{
                                AsyncImage(url: URL(string: "https://scontent.fbsb9-1.fna.fbcdn.net/v/t39.30808-6/298538957_489455429848754_8338744740369789501_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=5f2048&_nc_ohc=-7G7GCVDbrQQ7kNvgFSl-1m&_nc_ht=scontent.fbsb9-1.fna&oh=00_AYB2zxwsAiJLXT4oyi6Cn9AEjJrL2Spo6UOkwzIbNYovdw&oe=66700517")) { image in
                                    image
                                        .resizable()
                                } placeholder: {
                                    Color.red
                                }
                                .frame(width: 40, height: 40)
                                .padding(.leading)
                                Text(arrayMusicas[arrayMusicas.count-1].name)
                                    .padding()
                                    .padding(.leading, 8)
                                    .foregroundColor(.white)
                                Spacer()
                            }
                            ScrollView{
                                VStack{
                                    ForEach(arrayMusicas.prefix(arrayMusicas.count-1)){ item in
                                        NavigationLink(destination: Music(item: item)){
                                            HStack{
                                                AsyncImage(url: URL(string: item.capa)) { image in
                                                    image
                                                        .resizable()
                                                } placeholder: {
                                                    Color.red
                                                }
                                                .frame(width: 50, height: 50)
                                                .padding(.leading)
                                                Text(item.name)
                                                    .padding(.leading)
                                                    .padding(.top, 2)
                                                    .foregroundColor(.white)
                                                Spacer()
                                                Image(systemName: "ellipsis")
                                            }
                                        }
                                    }
                                }
                                Text("Sugeridos")
                                    .padding(.trailing, 220)
                                    .font(.largeTitle)
                                    .foregroundColor(.white)
                                ScrollView(.horizontal){
                                    HStack{
                                        ForEach(arraySug){ item in
                                            HStack{
                                                AsyncImage(url: URL(string: item.capa)) { image in
                                                    image
                                                        .resizable()
                                                        .frame(width: 150, height: 160)
                                                } placeholder: {
                                                    Color.red
                                                }
                                                
                                            }
                                        }
                                    }
                                }

                            }
                        }
                    }
                }
            }
        }.accentColor(.white)
    }
}

#Preview {
    ContentView()
}
