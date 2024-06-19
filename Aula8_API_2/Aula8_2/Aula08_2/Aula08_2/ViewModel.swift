//
//  ViewModel.swift
//  Aula08_2
//
//  Created by Turma02-8 on 18/06/24.
//

import Foundation



class ViewModel: ObservableObject{
    @Published var jobs: [Vaga] = []
    func fetchJobs(){
        guard let url = URL(string: "https://www.arbeitnow.com/api/job-board-api") else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do{
                let jsonDecodificado = try JSONDecoder().decode(API.self, from:data)
                DispatchQueue.main.async{
                    self?.jobs = jsonDecodificado.data
                }
            }catch{
                print(error)
            }
        }
        
        task.resume()
    }
}
