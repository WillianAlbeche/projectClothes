//
//  Extensions.swift
//  ProjectClothes
//
//  Created by Hojin Ryu on 02/08/21.
//

import Foundation
import CloudKit
import UIKit
import CoreData

extension NSManagedObject {
    static var className: String {
        return String(describing: self)
    }
}

extension CoreDataModel where Self: NSManagedObject {
    static var context: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
}

extension CoreDataModel where Self: NSManagedObject {
    static func all() -> [Self] {
        let fetchRequest = NSFetchRequest<Self>(entityName: Self.className)
        fetchRequest.predicate = NSPredicate(value: true)
        
        guard let data = try? context.fetch(fetchRequest) else {
            return []
        }
        return data
    }
    
    static func find(predicate: NSPredicate) -> [Self] {
        let fetchRequest = NSFetchRequest<Self>(entityName: Self.className)
        fetchRequest.predicate = predicate
        
        guard let data = try? context.fetch(fetchRequest) else {
            return []
        }
        return data
    }
    
    static func findById(with id: NSManagedObjectID) -> Self? {
        guard let entity = try? Self.context.existingObject(with: id) as? Self else {
            return nil
        }
        return entity
    }
}

extension CoreDataModel where Self: NSManagedObject {
    func save() -> Bool {
        guard let _ = try? Self.context.save() else { return false }
        return true
    }
}

extension CoreDataModel where Self: NSManagedObject {
    func destroy() -> Bool {
        Self.context.delete(self)
        guard let _ = try? Self.context.save() else { return false }
        return true
    }
}

extension CKAsset {
    func toUIImage() -> UIImage? {
        if let data = NSData(contentsOf: self.fileURL!) {
            return UIImage(data: data as Data)
        }
        return nil
    }
}


extension Data {
    func toUIImage() -> UIImage? {
        return UIImage(data: self)
    }
}

extension UIImage {
    func toURL() -> URL? {
        let data = self.pngData()
        let url = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(NSUUID().uuidString+".dat")
        do {
            try data!.write(to: url!)
        } catch let e as NSError {
            print("Error! \(e)");
        }
        return url
    }
}
