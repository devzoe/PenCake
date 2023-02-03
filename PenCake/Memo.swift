//
//  Memo.swift
//  PenCake
//
//  Created by 남경민 on 2023/01/31.
//

import Foundation
import CoreData
import SwiftUI

struct MemoDTO {
    var title : String?
    var content : String?
    var createdAt : String?
    var shortCreatedAt : String?
    var timestamp : Date?
}
struct MemoDao {
    // Add
    func addMemo(memo : MemoDTO, managedObjectContext: NSManagedObjectContext) {
        let newItem = Memo(context: managedObjectContext)
        newItem.timestamp = memo.timestamp
        newItem.title = memo.title
        newItem.content = memo.content
        newItem.createdAt = memo.createdAt
        newItem.shortCreatedAt = memo.shortCreatedAt
        
        do {
          try managedObjectContext.save()
        } catch {
          print("Error saving managed object context: \(error)")
        }
    }
    // Read
    /*
    public func readMemo() -> FetchedResults<Memo> {
        return memoList
    }
     */
    
    // Delete
    func deleteMemo(memo: Memo, managedObjectContext: NSManagedObjectContext) {
            managedObjectContext.delete(memo)
        do {
          try managedObjectContext.save()
        } catch {
          print("Error saving managed object context: \(error)")
        }

    }
    // Update
    func updateMemo(memo: Memo, managedObjectContext: NSManagedObjectContext) {
            
        do {
          try managedObjectContext.save()
        } catch {
          print("Error saving managed object context: \(error)")
        }

    }
}

struct MemoViewModel {
    var memoDao = MemoDao()
    
    func addMemo(title: String, content: String, managedObjectContext: NSManagedObjectContext) {
        var memo = MemoDTO()
        let nowDate = Date() // 현재의 Date (ex: 2020-08-13 09:14:48 +0000)
        let dateFormatter = DateFormatter()
        let shortDateFormatter = DateFormatter()

        dateFormatter.dateFormat = "yyyy년 MM월 dd일 a hh:mm" // 2020.08.13 오후 04시 30분
        dateFormatter.locale = Locale(identifier:"ko_KR") // PM, AM을 언어에 맞게 setting (ex: PM -> 오후)
        shortDateFormatter.dateFormat = "MM.dd" // 2020.08.13 오후 04시 30분
        shortDateFormatter.locale = Locale(identifier:"ko_KR") // PM, AM을 언어에 맞게 setting (ex: PM -> 오후)
        let createdAt = dateFormatter.string(from: nowDate) // 현재 시간의 Date를 format에 맞춰 string으로 반환
        let shortCreatedAt = shortDateFormatter.string(from: nowDate)
        
        memo.title = title
        memo.content = content
        memo.createdAt = createdAt
        memo.shortCreatedAt = shortCreatedAt
        memo.timestamp = nowDate
        
        memoDao.addMemo(memo : memo, managedObjectContext: managedObjectContext)
        
    }
    /*
    func readMemo() -> FetchedResults<Memo> {
        return memoDao.readMemo()
    }
     */
    func deleteMemo(memo: Memo, managedObjectContext: NSManagedObjectContext) {
        memoDao.deleteMemo(memo: memo, managedObjectContext: managedObjectContext)
    }
}
