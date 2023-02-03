//
//  UpdateMemoView.swift
//  PenCake
//
//  Created by 남경민 on 2023/01/29.
//


import SwiftUI

struct UpdateMemoView : View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var memo: Memo
    @State private var title : String
    @State private var content : String
   
    init(memo: Memo) {
        self.memo = memo
        
        self._title = State(initialValue: memo.title!)
        self._content = State(initialValue: memo.content!)

    }
    var body: some View {
        NavigationView {
            VStack {
                TextField("제목", text: $title)
                    .font(.pencakeFont(.regular))
                    .padding()
                TextField("내용을 입력하세요", text: $content)
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
                .onTapGesture {
                    let memo = self.memo
                    memo.title = self.title
                    memo.content = self.content
                    presentationMode.wrappedValue.dismiss()
                    
                }
            )
        }
        
    }
}



struct UpdateMemoView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateMemoView(memo: Memo())
    }
}

