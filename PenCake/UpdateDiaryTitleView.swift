//
//  UpdateDiaryTitleView.swift
//  PenCake
//
//  Created by 남경민 on 2023/01/29.
//

import SwiftUI

struct UpdateDiaryTitleView : View {
    @Environment(\.presentationMode) var presentationMode
    @State var text = "제목 업데이트"
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 15) {
                TextField("", text: $text)
                    .padding()
                        .font(.pencakeFont(.medium, size: 20))
                        .multilineTextAlignment(.center)
               
  
 
                    TextField("", text: $text)
                    .padding()
                        .font(.pencakeFont(.regular))
                        .multilineTextAlignment(.center)
      
                Spacer()

            }
          
            .navigationBarItems(leading: Text("취소")
                .font(.pencakeFont(.regular))
                .foregroundColor(.pencakeGray)
                .onTapGesture {
                presentationMode.wrappedValue.dismiss()
            }, trailing: Text("완료")
                .font(.pencakeFont(.regular))
                .foregroundColor(.pencakeBlue)
            )
        }
    }
}

struct UpdateDiaryTitleView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateDiaryTitleView()
    }
}
