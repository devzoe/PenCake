//
//  UpdateMemoView.swift
//  PenCake
//
//  Created by 남경민 on 2023/01/29.
//


import SwiftUI

struct UpdateMemoView : View {
    @Environment(\.presentationMode) var presentationMode

    @State private var text = "메모 업데이트"
    //@Binding var title : String
    //@Binding var content : String
    var body: some View {
        NavigationView {
            VStack {
                TextField("제목", text: $text)
                    .font(.pencakeFont(.regular))
                    .padding()
                TextField("내용을 입력하세요", text: $text)
                    .font(.pencakeFont(.regular))
                    .padding()
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


struct UpdateMemoView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateMemoView()
    }
}

