//
//  CreateMemoView.swift
//  PenCake
//
//  Created by 남경민 on 2023/02/01.
//

import SwiftUI

struct CreateMemoView : View {
    @Environment(\.managedObjectContext) private var managedObjectContext
    
    var memoViewModel : MemoViewModel = MemoViewModel()
    @Environment(\.presentationMode) var presentationMode
    @State private var title = ""
    @State private var content = ""
    //@Binding var title : String
    //@Binding var content : String
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
                    memoViewModel.addMemo(title: title, content: content, managedObjectContext: managedObjectContext)
                    presentationMode.wrappedValue.dismiss()
                }
            )
        }
        
    }
}




struct CreateMemoView_Previews: PreviewProvider {
    static var previews: some View {
        CreateMemoView()
    }
}

