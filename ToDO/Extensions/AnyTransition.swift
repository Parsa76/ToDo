//
//  AnyTransition.swift
//  ToDO
//
//  Created by Parsa Keshavarz on 22.01.24.
//

import SwiftUI

extension AnyTransition {
    static var moveInAndOut: AnyTransition {
        .asymmetric(
            insertion: .move(edge: .top).combined(with: .identity),
            removal: .move(edge: .top).combined(with: .opacity)
        )
    }
}
