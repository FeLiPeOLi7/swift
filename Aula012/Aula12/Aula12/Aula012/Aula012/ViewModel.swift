//
//  ViewModel.swift
//  Aula012
//
//  Created by Turma02-8 on 24/06/24.
//

import Foundation

class ViewModel: ObservableObject{
    @Published var umidades: [Umidade] = []
    func fetchUmidade(){
        guard let url = URL(string: "http://127.0.0.1:1880/buscarUmidade") else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do{
                let jsonDecodificado = try JSONDecoder().decode([Umidade].self, from:data)
                DispatchQueue.main.async{
                    self?.umidades = jsonDecodificado
                }
            }catch{
                print(error)
            }
        }
        
        task.resume()
    }
}
