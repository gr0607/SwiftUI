//
//  SpecialEffectsView.swift
//  Drawing
//
//  Created by admin on 27.09.2023.
//

import SwiftUI

struct SpecialEffectsView: View {
    var body: some View {
        ZStack {
          Image("example")
            
          Rectangle()
                .fill(.blue)
                .blendMode(.multiply)
        }
    }
}

struct SpecialEffectsView_Previews: PreviewProvider {
    static var previews: some View {
        SpecialEffectsView()
    }
}
