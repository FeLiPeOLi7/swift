//
//  NotificationView.swift
//  HackaFocus
//
//  Created by Turma02-11 on 25/06/24.
//

import SwiftUI

struct NotificationView: View {
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    //@StateObject var instVM = testeAPI()
    @State private var isLiked = false
    
    @State private var qtdLikes = 1
    var body: some View {
        VStack{
            HStack{
                //back navigation
                       Spacer()
                           .navigationBarBackButtonHidden(true)
                       .toolbar(content: {
                           ToolbarItem (placement: .navigationBarLeading)  {
                                    
                               Button(action: {
                                   presentationMode.wrappedValue.dismiss()
                               }, label: {
                                 //  Image(systemName: "arrow.left")
                                   Image(systemName: "house")
                                       .font(.system(size: 24))
                                       .foregroundColor(.principal)
                                   Text("home")
                                    .foregroundColor(.principal)
                               })}})
                   //back navigation
            }
            .padding(.horizontal)
            NavigationStack{
                VStack{
                    ScrollView(.vertical){
                        HStack{
                            HStack{
                                Image(systemName: "heart.fill")
                                    .font(.system(size: 28))
                                Text("333")
                            }
                            .foregroundColor(.principal)
                            Spacer()
                            VStack(alignment: .leading){
                                Text("deram gostei na sua publicaçäo:")
                                    .font(.system(size: 12))
                                Text("Leitura diária de hj! 📖")
                                    .bold()
                                Text("22/06, 10h21")
                                    .font(.system(size: 12))
                            }
                            Spacer()
                            AsyncImage(url: URL(string: "https://i.ytimg.com/vi/pom6RwxXCyY/maxresdefault.jpg?sqp=-oaymwEmCIAKENAF8quKqQMa8AEB-AH-CYAC0AWKAgwIABABGHIgRyg7MA8=&rs=AOn4CLAtgyK2D6WCoe6_kyOKfbBFlb_sDg")){
                                image in image
                                    .resizable()
                                    .frame(width: 50, height:50)
                                    .scaledToFill()
                                    .cornerRadius(10)
                            }placeholder: {ProgressView()}
                        }
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 16).stroke(.principal, lineWidth: 2))
                        HStack{
                            HStack{
                                Image(systemName: "text.bubble.rtl")
                                    .font(.system(size: 28))
                                Text("333")
                                    .font(.system(size: 18))
                            }
                            .foregroundColor(.principal)
                            Spacer()
                            VStack(alignment: .leading){
                                Text("comentaram na sua publicaçäo:")
                                    .font(.system(size: 12))
                                Text("Leitura diária de hj! 📖")
                                    .bold()
                                Text("22/06, 07h52")
                                    .font(.system(size: 12))
                            }
                            Spacer()
                            AsyncImage(url: URL(string: "https://i.ytimg.com/vi/pom6RwxXCyY/maxresdefault.jpg?sqp=-oaymwEmCIAKENAF8quKqQMa8AEB-AH-CYAC0AWKAgwIABABGHIgRyg7MA8=&rs=AOn4CLAtgyK2D6WCoe6_kyOKfbBFlb_sDg")){
                                image in image
                                    .resizable()
                                    .frame(width: 50, height:50)
                                    .scaledToFill()
                                    .cornerRadius(10)
                            }placeholder: {ProgressView()}
                        }
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 16).stroke(.principal, lineWidth: 2))
                        
                        HStack{
                            VStack(alignment: .leading){
                                Text("Fulano,")
                                    .font(.system(size: 18))
                                    .bold()
                                Text("pediu para entrar no desafio:")
                                    .font(.system(size: 16))
                                Text("Nome do desafio")
                                    .font(.system(size: 16))
                                    .bold()
                            }
                            Spacer()
                            Button{}label: {
                                Image(systemName: "checkmark.circle")
                                    .font(.system(size: 36))
                                    .foregroundColor(.green)
                            }
                            Button{}label: {
                                Image(systemName: "xmark.circle")
                                    .font(.system(size: 36))
                                    .foregroundColor(.red)
                            }
                        }
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 16).stroke(.principal, lineWidth: 2))
                        
                    }
                    .padding()
                }
            }
        }
    }
}

#Preview {
    NotificationView()
}
