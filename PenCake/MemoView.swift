//
//  MemoView.swift
//  PenCake
//
//  Created by 남경민 on 2023/01/26.
//
import SwiftUI
import PhotosUI

struct MemoView: View {
    @Environment(\.managedObjectContext) private var managedObjectContext
    @Environment(\.dismiss) private var dismiss
    var memoViewModel : MemoViewModel = MemoViewModel()
    
    @State var memo : FetchedResults<Memo>.Element
    @State var text = "memo"
    @State var date : Date = Date()
    @State var isFileActionSheetShowing = false
    @State var isMemoActionSheetShowing = false
    @State var showImagePicker: Bool = false
    @State var isMemoUpdateShowing = false
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    NavigationLink(destination: DatePickerView()) {
                        if let title = memo.title {
                            Text(title)
                                .font(.pencakeFont(.bold, size: 20))
                        }
                        
                    }
                        .padding(20)
                        .foregroundColor(.black)
                    Spacer()
                }
                HStack {
                    NavigationLink(destination: DatePickerView()) {
                        if let createdAt = memo.createdAt {
                            Text(createdAt)
                                .foregroundColor(.pencakeGray)
                                .font(.pencakeFont(.regular, size: 15))
                        }

                        
                    }
                        .padding(20)
                        .foregroundColor(.black)
                    Spacer()
                }
                
                HStack {
                    NavigationLink(destination: DatePickerView()) {
                        if let content = memo.content {
                            Text(content)
                                .font(.pencakeFont(.regular))
                        }
                        
                    }
                        .padding(20)
                        .foregroundColor(.black)
                    Spacer()
                }
                Spacer()
                HStack() {
                    Spacer()
                    HStack {
                        Button(action: {self.showImagePicker = true}, label: {
                            Image(systemName: "photo")
                                .padding(5)
                                .font(.system(size: 20))
                                .foregroundColor(.pencakeGray)
                                .background(Color.white)
                        })
                      
                        Button(action: {isFileActionSheetShowing = true }, label: {
                            Image(systemName: "square.and.arrow.up")
                                .padding(5)
                                .font(.system(size: 20))
                                .foregroundColor(.pencakeGray)
                                .background(Color.white)
                        })
                        .confirmationDialog("title", isPresented: $isFileActionSheetShowing) {
                            Button("텍스트로 내보내기") { }
                            Button("TXT 파일로 내보내기") { }
                            Button("취소", role: .cancel) { }
                        }
                       

                        Button(action: {isMemoActionSheetShowing = true }, label: {
                            Image(systemName: "ellipsis")
                                .padding(5)
                                .font(.system(size: 20))
                                .foregroundColor(.pencakeGray)
                                .background(Color.white)
                                .rotationEffect(.degrees(90))
                        })
                        .confirmationDialog("title", isPresented: $isMemoActionSheetShowing) {
                            Button("글 수정") {
                                print("글 수정")
                                self.isMemoActionSheetShowing = false
                                self.isMemoUpdateShowing.toggle()
                            }
                           
                            Button("글 이동") { }
                            Button("사진 첨부") { }
                            Button("날짜 수정") { }
                            Button("날짜 숨기기") { }
                            Button("변경 기록") { }
                            Button("글 삭제", role: .destructive) {
                                memoViewModel.deleteMemo(memo: memo, managedObjectContext: managedObjectContext)
                                dismiss()
                            }
                            Button("취소", role: .cancel) {}
                        }
                        .fullScreenCover(isPresented: $isMemoUpdateShowing, content: UpdateMemoView.init)
                    }.padding()
                }
            }
        }.sheet(isPresented: $showImagePicker, content: {
            let configuration = PHPickerConfiguration(photoLibrary: PHPhotoLibrary.shared())
            PhotoPicker(configuration: configuration, isPresented: $showImagePicker)
        })
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton())
        
    }
    
}

struct DatePickerView : View {
    @State
    var date : Date = Date()
    var body: some View {
        VStack {
            DatePicker("datePicker", selection: $date)
                .padding(50)
                .datePickerStyle(WheelDatePickerStyle()).labelsHidden()
        }.navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: BackButton())
        
    }
}


struct MemoView_Previews: PreviewProvider {
    static var previews: some View {
        MemoView(memo: Memo())
    }
}

