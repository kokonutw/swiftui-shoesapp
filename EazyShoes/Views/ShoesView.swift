//
//  ContentView.swift
//  EazyShoes
//
//  Created by Alumno on 11/12/24.
//

import SwiftUI

struct ShoesView: View {
    
    
    @StateObject var viewModel = ShoesListViewModel()
    

    init(){
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.orange]
    }
    
    var body: some View {
        NavigationStack{
            VStack{
                ScrollView(.horizontal,showsIndicators: false){
                    LazyHStack{
                        ForEach(APIEndPoint.allCases, id: \.self){endpoint in
                            ZStack{
                                Text(endpoint.displayName)
                                    .font(.subheadline)
                                    .foregroundStyle((viewModel.endpoit == endpoint) ? Color.orange : Color.gray)
                                    .padding([.leading,.trailing]).onTapGesture {
                                        viewModel.updateEndpoint(endpoint: endpoint)
                                    }
                            }
                        }
                    }.fixedSize()
                }
                //List
                ShoesListView(viewModel: viewModel)
            }
            .navigationTitle(viewModel.endpoit.displayName)
            
            
        }
    }
}

#Preview {
    ShoesView().preferredColorScheme(.dark)
}
