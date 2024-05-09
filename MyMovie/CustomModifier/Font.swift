//
//  Font.swift
//  MyMovie
//
//  Created by 민지은 on 2024/05/09.
//

import SwiftUI

private struct GrayRegularFont: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 17))
            .fontWeight(.regular)
            .foregroundStyle(.gray)
    }
    
}

private struct BlackSemiBoldFont: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 17))
            .fontWeight(.semibold)
    }
    
}

extension View {
    func asGrayTitleFont() -> some View {
        modifier(GrayRegularFont())
    }
    
    func asBlackTitleFont() -> some View {
        modifier(BlackSemiBoldFont())
    }
}
