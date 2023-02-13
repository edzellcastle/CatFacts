//
//  CatView.swift
//  CatFacts
//
//  Created by David Lindsay on 2/9/23.
//

import SwiftUI

struct CatView: View {
    @ObservedObject var viewModel: CatViewModel
    @State var url: URL = URL(string: catPhotoEndPoint + String(200) + "/" + String(300))!
    @State var width = 200
    var height = 300
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Spacer(minLength: 20.0)
                AsyncImage(url: url) { image in
                    image
                        .padding()
                        .border(.black, width: 4)
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    Color.gray
                }
                .frame(width:250, height: 250)
                Spacer(minLength: 20.0)
                TextField("", text: $viewModel.catFactString, axis: .vertical)
                    .lineLimit(5...)
                    .disabled(true)
                Spacer(minLength: 20.0)
            }
            .padding()
        }
        .onAppear {
            url = URL(string: catPhotoEndPoint + String(200) + "/" + String(height))!
            viewModel.start()
        }
        .gesture(
            TapGesture()
                .onEnded { _ in
                    width = Int.random(in: 201..<301)
                    url = URL(string: catPhotoEndPoint + String(width) + "/" + String(height))!
                    viewModel.start()
                }
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CatView(viewModel: CatViewModel(apiService:  APIClient()))
    }
}
