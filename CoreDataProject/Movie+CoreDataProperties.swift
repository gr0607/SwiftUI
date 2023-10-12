//
//  Movie+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by admin on 12.10.2023.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var title: String?
    @NSManaged public var director: String?
    @NSManaged public var year: Int16

    public var wrappedTtitle: String {
        title ?? "Unkwnoun Title"
    }
}

extension Movie : Identifiable {
    
}
