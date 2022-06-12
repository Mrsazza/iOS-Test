//
//  TestView.swift
//  iOS Test
//
//  Created by Sazza on 10/6/22.
//

import SwiftUI
import FirebaseDatabase

struct TestView: View {
    @StateObject var viewModel = ReadViewModel()
    var body: some View {
        VStack{
            if !viewModel.listObject.isEmpty{
                ScrollView{
                    ForEach(viewModel.listObject, id:\.id ) { item in
                        //AsyncImage(url: URL(string: item.url))
                        if item.image != nil{
                            Image(uiImage: item.image!)
                                .resizable()
                                .scaledToFit()
                                .frame( height: 320)
                        }
                    }
                }
            }
            
            Button(action: {
                viewModel.observeListObject()
//                viewModel.readObject()
            }, label: {
                Text("Press")
                    .foregroundColor(.black)
            })
            
        }
        .onAppear{
//            viewModel.readObject()
            viewModel.observeListObject()
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
