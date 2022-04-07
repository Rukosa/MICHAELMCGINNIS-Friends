//
//  DataController.swift
//  MICHAELMCGINNIS-Bookworm
//
//  Created by Michael Mcginnis on 4/6/22.
//

import Foundation
import CoreData
import SwiftUI

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "FriendsCoreDataModel")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
            
            self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        }
    }
}

