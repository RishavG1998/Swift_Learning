//
//  ProgressViewScreen.swift
//  Gemini Chat Bot
//
//  Created by Rishav Gupta on 08/09/24.
//

import SwiftUI

struct ProgressViewScreen: ViewModifier {
    var showLoader: Bool
    
    func body(content: Content) -> some View {
        content.overlay {
            if showLoader {
                ProgressView()
                    .progressViewStyle(.circular)
            }
        }
    }
}

extension View {
    func showLoader(showLoader: Bool) -> some View {
        modifier(ProgressViewScreen(showLoader: showLoader))
    }
}
