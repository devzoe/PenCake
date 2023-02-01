//
//  BackButton.swift
//  PenCake
//
//  Created by 남경민 on 2023/02/01.
//

import SwiftUI

struct BackButton : View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "chevron.backward") // set image here
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.pencakeGray)
                
            }
        }
    }
}
