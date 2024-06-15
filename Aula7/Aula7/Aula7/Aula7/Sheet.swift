//
//  Sheet.swift
//  Aula7
//
//  Created by Turma02-8 on 13/06/24.
//
import MapKit
import SwiftUI

struct Sheet: View {
    @State var item: Location
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack{
            VStack{
                Text("\(item.name)")
                    .foregroundColor(.black)
                    .font(.largeTitle)
                    .bold()
                AsyncImage(url: URL(string: item.flag)) { image in
                    image
                        .resizable()
                } placeholder: {
                    Color.red
                }
                .frame(width:80, height:60)
                Text("\(item.description)")
                Button("Press to dismiss") {
                    dismiss()
                }
                .padding()
                .background(.black)
            }
        }
    }
}

#Preview {
    Sheet(item: Location(name:"Brasil", coordinate: CLLocationCoordinate2DMake(-22.43275,-44.1725749), flag:"https:upload.wikimedia.org/wikipedia/commons/thumb/0/05/Flag_of_Brazil.svg/1280px-Flag_of_Brazil.svg.png", description: "Brasil neh, tu conhece"))
}
