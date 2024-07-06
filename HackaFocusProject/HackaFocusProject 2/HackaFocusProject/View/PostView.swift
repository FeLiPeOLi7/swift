//
//  ContentView.swift
//  HackaFocus
//
//  Created by Turma02-5 on 26/06/24.
//

import SwiftUI

struct SheetView: View {
    @Environment(\.dismiss) var dismiss
    @State var comment: String = ""
    var body: some View {
        ZStack{
            Color.white
            VStack{
                Text("Comentários")
                    .font(.largeTitle)
                    .bold()
                VStack{
                    HStack{
                        AsyncImage(url: URL(string: "https://s2-ge.glbimg.com/wpnXlOEofDtm9F4G4Ct-Ctbn13s=/0x0:3000x2220/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_bc8228b6673f488aa253bbcb03c80ec5/internal_photos/bs/2022/f/H/Env5wPSiSC2nHA7rkdlA/gettyimages-56034481.jpg")) { image in
                            image
                                .resizable()
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        } placeholder: {
                            Color.red
                        }
                        .frame(width: 50, height: 50)
                        .padding(.leading)
                        Text("Ronaldinho Gaucho comentou:")
                            .foregroundColor(.principal)
                    }
                    .padding(.leading, -80)
                    Text("Muito top mano, doido pra sair num role cntg, tmj!!")
                        .foregroundColor(.black)
                }
                
                VStack{
                    HStack{
                        AsyncImage(url: URL(string: "https://pm1.aminoapps.com/6515/3d0d757c5d7c6c6dbabe8587d82a68f2e16cd2e6_00.jpg")) { image in
                            image
                                .resizable()
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        } placeholder: {
                            Color.red
                        }
                        .frame(width: 50, height: 50)
                        .padding(.leading)
                        Text("Gugu Gaitero comentou:")
                            .foregroundColor(.principal)
                    }
                    .padding(.leading, -130)
                    Text("Cepo e Madeira!")
                        .foregroundColor(.black)
                        .padding(.leading, -190)
                }
                
                VStack{
                    HStack{
                        AsyncImage(url: URL(string: "https://i.ytimg.com/vi/x3wP_iu7h0A/maxresdefault.jpg")) { image in
                            image
                                .resizable()
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        } placeholder: {
                            Color.red
                        }
                        .frame(width: 50, height: 50)
                        .padding(.leading)
                        Text("Nal do Canal comentou:")
                            .foregroundColor(.principal)
                    }
                    .padding(.leading, -130)
                    Text("Pokemon!!")
                        .foregroundColor(.black)
                        .padding(.leading, -190)
                }
                Spacer()
                HStack{
                    Spacer()
                    TextField("Deixe um comentário:", text: $comment)
                        .multilineTextAlignment(.center)
                    Spacer()
                }
            }
            .padding(.top, 50)
        }
    }
}

struct PostView: View {
    //@State var post: Post

    var post: Post
    @State private var showSheet = false
    var body: some View {
        VStack{
            ZStack{
                Color.principal
                    .ignoresSafeArea()
                    .frame(height:400)
                
                ZStack {
                    VStack {
                        Spacer()
                        Image(systemName: "photo")
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    .frame(width: 350, height: 300)
                    .background(.white)
                    
                    if(post.img != nil){
                        AsyncImage(url: URL(string: post.img!)) {
                            result in
                            result.image?
                                .resizable()
                        }
                        .frame(width: 350, height: 300)
                        .clipShape(Rectangle())
                    }
                }
                .clipShape(Circle())
                .padding(.bottom, -250)
            }
            
            Spacer()
            HStack{
                Image(systemName: "text.bubble")
                Button("Comentários"){
                    showSheet.toggle()
                }
                .foregroundColor(.principal)
                .sheet(isPresented: $showSheet) {
                    SheetView()
                }
            }
        }
    }
}

#Preview {
    PostView(post: Post(img: "https://www.shutterstock.com/image-photo/studio-portrait-gray-white-tabby-260nw-2273586945.jpg", description: "Post do meu cão"))
}

