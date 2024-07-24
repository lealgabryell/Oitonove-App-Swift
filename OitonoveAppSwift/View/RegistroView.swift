//
//  RegistroView.swift
//  ConsumindoAPI
//
//  Created by Turma01-17 on 24/07/24.
//

import SwiftUI

struct RegistroView: View {
    @State var vendaAuxcliente : String = ""
    @State var produtoAuxId : String = ""
    @State var produtoAuxDescricao : String = ""
    @State var produtoAuxCor : String = ""
    @State var produtoAuxTamanho : String = ""
    @State var produtoAuxValorUnit : String = ""
    @State var vendaAuxQuant : String = ""
    @State var vendaAuxData : String = ""
    @State var count : Int = 0
    
    
    @State var listaProdutos : [Produto] = []
    
    
    var body: some View {
        ZStack{
            VStack{
                VStack{
                    Image("logo_oitonove")
                        .resizable()
                        .frame(width: 105, height: 100)
                }
                VStack(spacing: 20){
                    TextField("Nome do Cliente: ", text : $vendaAuxcliente)
                        .padding(5)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                        .cornerRadius(4)
                    TextField("SKU do produto: ", text: $produtoAuxId)
                        .padding(5)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                        .cornerRadius(4)
                }
                .padding()
                Button("Adicionar a compra"){
                    let produto : Produto = Produto(id : Int(produtoAuxId), descricao : "", cor : "", tamanho : "", valorUnit : 0.0)
                    count+=1
                    listaProdutos.append(produto)
                }
            }
        }
    }
}

#Preview {
    RegistroView()
}
