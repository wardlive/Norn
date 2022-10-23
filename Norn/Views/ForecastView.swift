//
//  ForecastView.swift
//  Norn
//
//  Created by Pavel Neprin on 10/24/22.
//

import SwiftUI

struct ForecastView: View {
    @State private var selection = 0
    var bottomSheetTranslationProrated: CGFloat = 1
    
    var body: some View {
        ScrollView {
            
        }
        //            .backgroundBlur(radius: 25, opaque: true)
        .background(.ultraThinMaterial)
        .background(Color.bottomSheetBackground)
        .clipShape(RoundedRectangle(cornerRadius: 44))
//        .innerShadow(shape: RoundedRectangle(cornerRadius: 44), color: Color.bottomSheetBorderMiddle, lineWidth: 1, offsetX: 0, offsetY: 1, blur: 0, blendMode: .overlay, opacity: 1 - bottomSheetTranslationProrated)
        .overlay {
            // MARK: Bottom Sheet Separator
            Divider()
                .blendMode(.overlay)
                .background(Color.bottomSheetBorderTop)
                .frame(maxHeight: .infinity, alignment: .top)
                .clipShape(RoundedRectangle(cornerRadius: 44))
        }
        .overlay {
            // MARK: Drag Indicator
            RoundedRectangle(cornerRadius: 10)
                .fill(.black.opacity(0.3))
                .frame(width: 48, height: 5)
                .frame(height: 20)
                .frame(maxHeight: .infinity, alignment: .top)
        }
    }
}


struct ForecastView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastView()
    }
}
