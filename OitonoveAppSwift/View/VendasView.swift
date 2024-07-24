//
//  VendasView.swift
//  ConsumindoAPI
//
//  Created by Turma01-17 on 23/07/24.
//

import SwiftUI

struct VendasView: View {
    
    @StateObject var vm = ViewModel()
    @State var showingSheet : Bool = false
    @State var auxVenda : Vendas = Vendas(_id: "", _rev: "", cliente: "", produto: [], quantidade: 0, data: "")
    
    var body: some View {
        NavigationStack{
            ZStack{
                VStack{
                    HStack(spacing: 100){
                        NavigationLink(destination: RegistroView()){
                        Text("Registrar venda")
                        }
                        NavigationLink(destination: AlterarVendaView()){
                            Text("Alterar venda")
                        }
                    }
                    HStack{
                        Text("Cliente:")
                        Spacer()
                        Text("Data:")
                    }
                    .padding()
                    ScrollView{ VStack{
                        ForEach(vm.vendas, id: \.self){e in
                            VStack{
                                HStack{
                                    Text(e.cliente!)
                                    Spacer()
                                    Text(e.data!)
                                }.padding()
                                Rectangle()
                                    .foregroundColor(.gray)
                                    .frame(width:300, height: 1)
                            }.onTapGesture {
                                showingSheet = true
                                auxVenda = e
                            }
                        }
                    }.sheet(isPresented : $showingSheet){
                        
                        SheetView(recebeAuxVenda: $auxVenda)
                        
                    }
                        
                    }
                }
            }
            
        }
        .onAppear(){
            vm.fetch()
            
        }
        
    }
    
}

#Preview {
    VendasView()
}
