//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by admin on 15.10.2023.
//

import SwiftUI
import CoreData

enum MyPredicate: String {
    case beginsWith = "BEGINSWITH"
    case equal = "=="
    case contains = "CONTAINS"
}

struct FilteredList<T: NSManagedObject, Content: View>: View {
    @FetchRequest var fetchRequest: FetchedResults<T>
    
    let content: (T) -> Content
    
    var body: some View {
        List(fetchRequest, id: \.self) { item in
            self.content(item)
        }
    }
    
    init(sortDesriptors: [SortDescriptor<T>], predicate: MyPredicate, filterKey: String, filterValue: String, @ViewBuilder content: @escaping (T) -> Content) {
        _fetchRequest = FetchRequest<T>(sortDescriptors: sortDesriptors, predicate: NSPredicate(format: "%K \(predicate.rawValue) %@", filterKey, filterValue))
        self.content = content
    }
}

