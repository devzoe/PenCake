//
//  ContentView.swift
//  PenCake
//
//  Created by 남경민 on 2023/01/26.
//

import SwiftUI
import CoreData

struct MainView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var isPresented = false
    var body: some View {
        NavigationView {
            VStack {
                ListItem()
                HStack {
                    Spacer()
                    Button(action: {self.isPresented.toggle()}, label: {
                        Image(systemName: "ellipsis")
                            .padding()
                            .font(.system(size: 20))
                            .foregroundColor(.gray)
                            .background(Color.white)
                    })
                    .padding(10)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                    .fullScreenCover(isPresented: $isPresented, content: FullScreenModalView.init)
                }.padding()
            }
            
        }
        
    }
    
}

struct ListItem : View {
    // 데이터 요청
    @FetchRequest(entity: Memo.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Memo.timestamp, ascending: false)],
        animation: .default)
    // 데이터 결과
    private var memos: FetchedResults<Memo>
    
    var body: some View {
        // header로 넣어주기
        Section(header: ListHeader()) {
            List {
                ForEach(memos) { memo in
                    ZStack {
                        NavigationLink {
                            MemoView(memo: memo)
                        } label: {
                            EmptyView()
                        }.opacity(0)
                        HStack{
                            Text(memo.title!)
                                .font(.pencakeFont(.regular))
                            
                            Spacer()
                            Text(memo.shortCreatedAt!)
                                .font(.pencakeFont(.regular, size: 13))
                            
                                .foregroundColor(.pencakeGray)
                        }
                    }
                    .listRowSeparator(.hidden)
                }
                    
            }
            
        }.listStyle(.plain)
    }
}
struct ListHeader : View {
    @State var text = ""
    @State var isPresented = false
    var body: some View {
        VStack(alignment: .center) {
            Text("이야기")
                .padding()
                .foregroundColor(.black)
                .font(.pencakeFont(.bold, size: 20))
                .onTapGesture {
                    self.isPresented.toggle()
                }
                .fullScreenCover(isPresented: $isPresented, content: UpdateDiaryTitleView.init)
            
            
            Text("이야기")
                .font(.pencakeFont(.regular, size: 15))
                .padding()
                .foregroundColor(.black)
                .onTapGesture {
                    self.isPresented.toggle()
                }
                .fullScreenCover(isPresented: $isPresented, content: UpdateDiaryTitleView.init)
                
            Divider().padding()
        }
    }
}
struct FullScreenModalView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var createMemo = false
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            Text("앱 설정")
                .padding(20)
                .font(.pencakeFont(.regular))
            Text("이 이야기")
                .padding(20)
                .font(.pencakeFont(.regular))
            Divider()
                .frame(width: 50)
                .padding(20)
            Text("모든 이야기")
                .padding(30)
                .font(.pencakeFont(.regular))
            Divider()
                .frame(width: 50)
                .padding(20)
            Text("검색")
                .padding(20)
                .font(.pencakeFont(.regular))
            Text("글 추가")
                .padding(20)
                .font(.pencakeFont(.regular))
                .foregroundColor(.pencakeBlue)
                .onTapGesture {
                    self.createMemo.toggle()
                }
                
            Spacer()
            HStack {
                Spacer()
                Button(action: {presentationMode.wrappedValue.dismiss()}, label: {
                    Image(systemName: "xmark")
                        .padding()
                        .font(.system(size: 20))
                        .foregroundColor(.gray)
                        .background(Color.white)
                })
                .padding(10)
                .clipShape(Circle())
               // .overlay(Circle().stroke(Color.gray, lineWidth: 1))
            }.padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .fullScreenCover(isPresented: $createMemo, content: CreateMemoView.init)
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
