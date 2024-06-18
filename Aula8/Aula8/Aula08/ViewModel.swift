//
//  ViewModel.swift
//  Aula08
//
//  Created by Turma02-8 on 14/06/24.
//

import Foundation

class ViewModel: ObservableObject{
    @Published var marcas: [Marca] = []
    @Published var tipo_modelos: [Modelo] = []
    @Published var tipo_anos: [Ano] = []
    @Published var singleObject: Price?
    
    func fetchMarcas(){
        guard let url = URL(string: "https://parallelum.com.br/fipe/api/v1/carros/marcas") else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do{
                let jsonDecodificado = try JSONDecoder().decode([Marca].self, from:data)
                DispatchQueue.main.async{
                    self?.marcas = jsonDecodificado
                }
            }catch{
                print(error)
            }
        }
        
        task.resume()
    }
    
    func fetchModelos(mId: String){
        guard let url = URL(string: "https://parallelum.com.br/fipe/api/v1/carros/marcas/\(mId)/modelos") else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do{
                let jsonDecodificado = try JSONDecoder().decode(APIModelo.self, from:data)
                
                DispatchQueue.main.async{
                    self?.tipo_modelos = jsonDecodificado.modelos
                }
            }catch{
                print(error)
            }
        }
        
        task.resume()
    }
    
    func fetchAno(mId: String, aId: Int){
        guard let url = URL(string: "https://parallelum.com.br/fipe/api/v1/carros/marcas/\(mId)/modelos/\(aId)/anos") else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do{
                let jsonDecodificado = try JSONDecoder().decode([Ano].self, from:data)
                
                DispatchQueue.main.async{
                    self?.tipo_anos = jsonDecodificado
                }
            }catch{
                print(error)
            }
        }
        
        task.resume()
    }
    
    func fetchPrice(mId: String, aId: Int, anId: String){
        guard let url = URL(string: "https://parallelum.com.br/fipe/api/v1/carros/marcas/\(mId)/modelos/\(aId)/anos/\(anId)") else{
            return
        }
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do{
                let jsonDecodificado = try JSONDecoder().decode(Price.self, from:data)
                
                DispatchQueue.main.async{
                    self?.singleObject = jsonDecodificado
                }
            }catch{
                print(error)
            }
        }
        
        task.resume()
    }
}
