//
//  ContentView.swift
//  Aula7
//
//  Created by Turma02-8 on 13/06/24.
//

import SwiftUI
import MapKit


struct ContentView: View {
    @State private var showSheet = false
    @State private var name: String = "Brazil"
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: -14.2350, longitude: -51.9253),
            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        )
    )
    var body: some View {
            VStack{
                ZStack{
                    Map(position: $position){
                        ForEach(Locais){item in
                            Annotation("\(item.name)", coordinate: item.coordinate) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(Color.teal)
                                    Text("🎓")
                                        .padding(5)
                                    Button("A"){
                                        showSheet.toggle()
                                    }
                                    .sheet(isPresented: $showSheet) {
                                        Sheet(item: item)
                                    }
                                }
                            }
                        }
                        //forach
                        //annotation
                    }
                        .ignoresSafeArea()
                    VStack{
                        Rectangle()
                            .frame(height:150)
                            .foregroundColor(.white)
                            .opacity(0.6)
                            .ignoresSafeArea()
                        Text("World Map")
                            .font(.largeTitle)
                            .padding(.top, -160)
                        Text("\(name)")
                            .padding(.top, -120)

                        Spacer()
                        HStack{
                            ForEach(Locais){ item in
                                Button{
                                    name = item.name
                                    position = MapCameraPosition.region(
                                        MKCoordinateRegion(
                                            center:item.coordinate,
                                            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)))
                                    
                            }label:{
                                    AsyncImage(url: URL(string: item.flag)) { image in
                                        image
                                            .resizable()
                                    } placeholder: {
                                        Color.red
                                    }
                                    .frame(width:80, height:60)
                                }
                            }
                        }
                    }
                    
            }
        }
    }
}

#Preview {
    ContentView()
}
