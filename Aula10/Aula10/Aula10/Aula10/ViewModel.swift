//
//  ViewModel.swift
//  Aula10
//
//  Created by Turma02-8 on 19/06/24.
//

import Foundation

class ViewModel: ObservableObject{
    @Published var personagens: [Personagem] = []
    func fetchPersonagens(){
        guard let url = URL(string: "http://127.0.0.1:1880/buscarFelipe") else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do{
                let jsonDecodificado = try JSONDecoder().decode([Personagem].self, from:data)
                DispatchQueue.main.async{
                    self?.personagens = jsonDecodificado
                }
            }catch{
                print(error)
            }
        }
        
        task.resume()
    }
}
