//
//  ContentView.swift
//  ConsumindoAPI
//
//  Created by Turma01-17 on 23/07/24.
//

import SwiftUI

struct ContentView: View {  
    var body: some View {
        NavigationStack{
            ZStack{
                VStack{
                    VStack{
                        Image("logo_oitonove")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 250)
                    }
                        Text("Gestão de Vendas")
                        .font(.title)
                    Spacer()
                    VStack(spacing: 30){
                        NavigationLink(destination: VendasView()){
                            Text("Acessar vendas")
                        }
                        NavigationLink(destination: RegistroView()){
                            Text("Registrar venda")
                        }
                    }
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
