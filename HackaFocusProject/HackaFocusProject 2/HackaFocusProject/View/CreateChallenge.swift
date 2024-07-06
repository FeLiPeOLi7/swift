//
//  CreateChallengeView.swift
//  HackaFocus
//
//  Created by Turma02-6 on 24/06/24.
//

import SwiftUI

struct CreateChallenge: View {
    @Environment(\.dismiss) var dismiss
    
    @StateObject var ChallengeVM = ChallengeManager()
    @StateObject var MembershipVM = MembershipManager()
    
    @State var profile: Profile = Profile(firstName: "Fulano")
    
    @State private var name: String = ""
    @State private var description: String = ""
    @State private var start_date: String = ""
    @State private var end_date: String = ""
    @State private var picture_URL: String = ""
    @State private var scoring_mode: Int = 0
    
    private let scoring_descriptions: [String] = [
        "Quantidade de dias presente",
        "Quantidade de horas registradas",
        "Quantidade de tarefas concluidas"
    ]
    @State private var selected_description: String = "Check diariamente"
    @State private var scoring_buttons_foreground: [Color] = [.white, .orange, .orange]
    @State private var scoring_buttons_background: [Color] = [.orange, .white, .white]

    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                
                ZStack {
                    Image(systemName: "photo")
                        .foregroundColor(.gray)
                    AsyncImage(url: URL(string: picture_URL)) {
                        result in
                        result.image?
                            .resizable()
                            .frame(width: 350, height: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    }
                }
                .frame(width: 350, height: 200)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(.gray, lineWidth: 2)
                )
                
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.white)
                        .frame(width: 350, height: 35)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.gray, lineWidth: 2)
                        )
                    HStack(spacing: 0) {
                        TextField(
                            "URL da imagem",
                            text: $picture_URL
                        )
                        .padding()
                        .frame(width: 285, height: 35)
                        
                        PasteButton(payloadType: String.self) { urls in
                            guard let picture_URL = urls.first else { return }
                            self.picture_URL = picture_URL
                        }
                        .labelStyle(.iconOnly)
                        .tint(.red)
                        //                    .buttonBorderShape(.capsule)
                        //                    .frame(width: 80)
                        //                    .padding(.leading, 20)
                        .padding(.trailing, 15)
                    }
                }
                
                //            Spacer()
                
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.white)
                        .frame(width: 350, height: 35)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.orange, lineWidth: 2)
                        )
                    TextField(
                        "Nome do grupo",
                        text: $name
                    )
                    .padding()
                    .frame(width: 350, height: 35)
                }
                
                TextField(
                    "Descrição (opcional)",
                    text: $description,
                    axis: .vertical
                )
                .padding()
                .frame(width: 350, height: 70, alignment: .top)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.orange, lineWidth: 2)
                )
                
                TextField(
                    "dd/mm/aaaa",
                    text: $start_date
                )
                .padding()
                .frame(width: 350, height: 35)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.orange, lineWidth: 2)
                )
                
                TextField(
                    "dd/mm/aaaa",
                    text: $end_date
                )
                .padding()
                .frame(width: 350, height: 35)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.orange, lineWidth: 2)
                )
                
                //            Spacer()
                
                HStack {
                    Spacer()
                    
                    Button(action: {
                        scoring_mode = 0
                        selected_description = scoring_descriptions[0]
                        scoring_buttons_foreground = [.white, .orange, .orange]
                        scoring_buttons_background = [.orange, .white, .white]
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(scoring_buttons_background[0])
                            Image(systemName: "calendar.badge.checkmark")
                                .foregroundColor(scoring_buttons_foreground[0])
                        }
                        .frame(width: 70, height: 70)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.orange, lineWidth: 2)
                        )
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        scoring_mode = 1
                        selected_description = scoring_descriptions[1]
                        scoring_buttons_foreground = [.orange, .white, .orange]
                        scoring_buttons_background = [.white, .orange, .white]
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(scoring_buttons_background[1])
                            Image(systemName: "timer")
                                .foregroundColor(scoring_buttons_foreground[1])
                        }
                        .frame(width: 70, height: 70)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.orange, lineWidth: 2)
                        )
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        scoring_mode = 2
                        selected_description = scoring_descriptions[2]
                        scoring_buttons_foreground = [.orange, .orange, .white]
                        scoring_buttons_background = [.white, .white, .orange]
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(scoring_buttons_background[2])
                            Image(systemName: "checklist")
                                .foregroundColor(scoring_buttons_foreground[2])
                        }
                        .frame(width: 70, height: 70)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.orange, lineWidth: 2)
                        )
                    }
                    
                    Spacer()
                }
                .frame(width: 350, height: 70)
                //            .padding(5)
                
                Spacer()
                
                ZStack {
                    Rectangle()
                        .foregroundStyle(Color.orange.opacity(0.1))
                        .frame(width: 400, height: 55)
                    VStack {
                        Text("Pontuação:")
                            .bold()
                            .foregroundColor(.orange)
                        Text(selected_description)
                            .foregroundColor(.orange)
                        //                .padding(5)
                    }
                }
                
                Spacer()
                
                Button(action: {
                    ChallengeVM.createChallenge(challenge: Challenge(name: name, description: description, start_date: start_date, end_date: end_date, picture_URL: picture_URL, scoring_mode: scoring_mode));
                    MembershipVM.createMembership(membership: Membership(profile: profile, challenge: Challenge(name: name, description: description, start_date: start_date, end_date: end_date, picture_URL: picture_URL, scoring_mode: scoring_mode), role: "ADM", currentStreak: 0));
                    dismiss();
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 140, height: 35)
                            .foregroundColor(.orange)
                        Text("Criar Grupo")
                            .foregroundColor(.white)
                            .bold()
                    }
                }
                //            .padding(.top, 20)
                .frame(width: 140, height: 35)
                
                Spacer()
                Spacer()
            }
            .frame(width: 400, height: 500)
            //        .padding(.top, 20)
        }
//        .background(Color.black.opacity(0.05))
    }
}

#Preview {
    CreateChallenge()
}


//struct CreateChallenge: View {
//    @State var profile: Profile
//    @State private var challenge = Challenge(name: "")
//    @ObservedObject private var challengeManager = ChallengeManager()
//    @ObservedObject private var membershipManager = MembershipManager()
//
//    var body: some View {
//        NavigationStack {
//            VStack {
//                Form {
//                    TextField("name", text: $challenge.name)
//                    .autocapitalization(.none)
//
//                    Button(action: {
//                        membershipManager.createMembership(membership: Membership(profile: profile, challenge: challenge))
//                        challengeManager.createChallenge(challenge: challenge)
//                        // Retorna pra main
//                    }) {
//                        Text("Create Challenge")
//                    }
//                }
//                List(challengeManager.challenges, id: \.self._id) { challenge in
//                    Text(challenge.name)
//                }
//                .onAppear() {
//                    challengeManager.fetchChallenges()
//                }
//            }
//        }
//    }
//}
//
//#Preview {
//    CreateChallenge(profile: Profile(firstName: "XXX"))
//}
