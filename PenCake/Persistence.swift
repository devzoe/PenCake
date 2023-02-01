//
//  Persistence.swift
//  PenCake
//
//  Created by 남경민 on 2023/01/26.
//

import CoreData

// 코어 데이터를 관리
struct PersistenceController {
    // 싱글톤
    static let shared = PersistenceController()
    let container: NSPersistentContainer // 컨테이너

    // 초기화
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "PenCake") // db접근
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    func saveContext() {
      let context = container.viewContext
      if context.hasChanges {
        do {
          try context.save()
        } catch {
          let nserror = error as NSError
          fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
      }
    }
    
    
    /*
    // 데이터 read??
    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        for _ in 0..<10 {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
        }
        do {
            try viewContext.save()
        } catch {
            
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()
     */
}
