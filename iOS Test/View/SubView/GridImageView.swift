//
//  GridImageView.swift
//  iOS Test
//
//  Created by Sazza on 1/6/22.
//

import SwiftUI

struct GridImageView: View {
    var image: String
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible()),
            ]
    var body: some View {
        ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(0..<15, id: \.self) { item in
                            Image(image)
                                .resizable()
                                .scaledToFit()
                        }
                    }
                    .padding(.horizontal)
                }
               // .frame(maxHeight: 300)
    }
}

struct GridImageView_Previews: PreviewProvider {
    static var previews: some View {
        GridImageView(image: "img1")
    }
}
