//
//  CarouselImage.swift
//  iOS Test
//
//  Created by Sazza on 1/6/22.
//

import Foundation

struct CarouselImage: Identifiable {
    var id = UUID().uuidString
    let imageName: String
}


let carousel: [CarouselImage] = [
    .init(imageName: "img1"),
    .init(imageName: "img2"),
    .init(imageName: "img3"),
    .init(imageName: "img4"),
    .init(imageName: "img5"),
    .init(imageName: "img6"),
]

