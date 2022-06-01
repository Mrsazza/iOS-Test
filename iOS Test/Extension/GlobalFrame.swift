//
//  GlobalFrame.swift
//  iOS Test
//
//  Created by Sazza on 1/6/22.
//

import SwiftUI

extension UIView {
    var globalFrame: CGRect? {
        let rootView = UIApplication
            .shared
            .connectedScenes
            .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
            .first { $0.isKeyWindow }?.rootViewController?.view
        //UIApplication.shared.windows.filter({$0.isKeyWindow}).first?.rootViewController?.view
        return self.superview?.convert(self.frame, to: rootView)
    }
}
