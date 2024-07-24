//
//  ViewModel.swift
//  ConsumindoAPI
//
//  Created by Turma01-17 on 23/07/24.
//

import Foundation

class ViewModel : ObservableObject {
    @Published var vendas : [Vendas] = []
    @Published var produtos : [Produto] = []
    
    func fetch() {
        guard let url = URL(string: "http://127.0.0.1:1880/readUnifacisa") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){
            [weak self] data, _, error in
            
            guard let data = data, error == nil else{
                return
            }
            do {
                let parsed = try JSONDecoder().decode([Vendas].self, from: data)
                DispatchQueue.main.async {
                    self?.vendas = parsed
                }
            }
            catch {
                print(error)
            }
        }
        task.resume()
    }
    
    func create(data: Vendas) {
        guard let url = URL(string: "http://127.0.0.1:1880/createUnifacisa") else {
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do{
            var teste =  try JSONEncoder().encode(data)
            request.httpBody = teste
        }catch{
            print(error)
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let _ = data, error == nil else {
                return
            }
        }
        task.resume()
    }

}
