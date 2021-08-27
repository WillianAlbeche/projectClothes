//
//  Protocols.swift
//  PackingApp
//
//  Created by Pedro Gomes Rubbo Pacheco on 21/07/21.
//

import CoreData

protocol Readable {
    static func all() -> [Self]
    static func find(predicate: NSPredicate) -> [Self]
    static func findById(with id: NSManagedObjectID) -> Self?
}

protocol Writeable {
    func save() -> Bool
}

protocol Deletable {
    func destroy() -> Bool
}

protocol CoreDataModel: Writeable, Deletable, Readable {
    static var context: NSManagedObjectContext { get }
}
