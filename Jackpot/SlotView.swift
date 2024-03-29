//
//  SlotView.swift
//  Jackpot
//
//  Created by SOUMYATTAM DEY on 09/05/21.
//

import SwiftUI

struct SlotView: View {
    
    @Binding  var symbol:String
    @Binding  var background:Color
    
    private let transition:AnyTransition=AnyTransition.move(edge: .top)
    
    var body: some View {
        VStack {
            if symbol=="star" {
                Image(symbol)
                .resizable()
                .aspectRatio(contentMode: .fit)
                    .transition(transition)
            } else if symbol=="apple"{
                Image(symbol)
                .resizable()
                .aspectRatio(contentMode: .fit)
                    .transition(transition)

            }else {
                Image(symbol)
                .resizable()
                .aspectRatio(contentMode: .fit)
                    .transition(transition)

            }
        }
        .background(background.opacity(0.5))
        .cornerRadius(20)

    }
}

struct SlotView_Previews: PreviewProvider {
    static var previews: some View {
        SlotView(symbol: Binding.constant("cherry"),background: Binding.constant(Color.green))
    }
}
