//
//  ImageCarousel.swift
//  iOS Test
//
//  Created by Sazza on 1/6/22.
//

import SwiftUI

struct ImageCarousel: View {
    //let images: [CarouselImage]
    let images:[ImageObject]
    
    func getScale(proxy: GeometryProxy) -> CGFloat {
        //        guard let rootView = UIApplication.shared.windows.filter({$0.isKeyWindow}).first?.rootViewController?.view else { return 1}
        let midPoint: CGFloat = 125
        
        let viewFrame = proxy.frame(in: CoordinateSpace.global)
        
        var scale: CGFloat = 1.0
        let deltaXAnimationThreshold: CGFloat = 125
        
        let diffFromCenter = abs(midPoint - viewFrame.origin.x - deltaXAnimationThreshold / 2)
        if diffFromCenter < deltaXAnimationThreshold {
            scale = 1 + (deltaXAnimationThreshold - diffFromCenter) / 500
        }
        
        return scale
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 10) {
                ForEach(images, id: \.id) { num in
                    GeometryReader { proxy in
                        let scale = getScale(proxy: proxy)
                        VStack(spacing: 8) {
                            
                            AsyncImage(
                                url: URL(string: num.url),
                                content: { image in
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 110)
                                        .clipped()
                                        .cornerRadius(8)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 8)
                                                .stroke(Color(white: 0.4))
                                        )
                                        .shadow(radius: 3)
                                },
                                placeholder: {
                                    ProgressView()
                                }
                            )
                          //  Image(num.imageName)
//                                .resizable()
//                                .scaledToFill()
//                                .frame(width: 110)
//                                .clipped()
//                                .cornerRadius(8)
//                                .overlay(
//                                    RoundedRectangle(cornerRadius: 8)
//                                        .stroke(Color(white: 0.4))
//                                )
//                                .shadow(radius: 3)
                        }
                        .scaleEffect(.init(width: scale, height: scale))
                        .animation(.easeInOut(duration: 1), value: 1.0)
                        .padding(.vertical)
                    }
                    .frame(width: 60, height: 210)
                    .padding(.horizontal, 32)
                    .padding(.vertical, 32)
                }
                Spacer()
                    .frame(width: 16)
            }
        }
    }
}

//struct ImageCarousel_Previews: PreviewProvider {
//    static var previews: some View {
//        ImageCarousel(images: carousel)
//    }
//}
