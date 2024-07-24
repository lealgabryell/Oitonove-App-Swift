//
//  SheetView.swift
//  ConsumindoAPI
//
//  Created by Turma01-17 on 23/07/24.
//

import SwiftUI

struct SheetView: View {
    @Binding var recebeAuxVenda : Vendas
    // @StateObject var vm = ViewModel()
    var body: some View {
        VStack{
            Image("logo_oitonove")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 200)
            Text("\(recebeAuxVenda.cliente!)")
                .font(.title)
            ScrollView{
                ForEach(recebeAuxVenda.produto, id: \.self){ e in
                    if let valorUnit = e.valorUnit {
                        let formattedValorUnit = String(format: "%.2f", valorUnit)
                        Text("Produto: \(e.descricao!)\r\nCor: \(e.cor!)\r\nTamanho: \(e.tamanho!)\r\nValor da peça: R$\(formattedValorUnit)\r\nData da compra: \(recebeAuxVenda.data!)\r\n")
                    }
                }
                
            }
        }
        //        .onAppear(){
        //            vm.fetch()
        //        }
        
    }
}
//#Preview {
//    SheetView()
//}
