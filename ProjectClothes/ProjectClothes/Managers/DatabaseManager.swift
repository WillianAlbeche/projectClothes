//
//  DatabaseManager.swift
//  ProjectClothes
//
//  Created by Hojin Ryu on 30/07/21.
//

import Foundation
import CloudKit
import UIKit

class DatabaseManager {
    
    // MARK: - Properties
    
    /// A user's private Database
    let privateDB = CKContainer.default().privateCloudDatabase
    
    /// For use of Singleton.
    static let shared: DatabaseManager = DatabaseManager()
    
    
    // MARK: - API
    
    /// To filter out clothes in a user's wardrobe.
    /// - Parameters:
    ///   - completion: A handler to process completion `success` or `failure`.
    func filterClothesList( searchingList: [String]?, completionQueue: DispatchQueue = .main, _ completion: @escaping (Result<[Clothes], Error>) -> Void) {
        
        //        let searchUp = searchingList.map { filteringSearchResults(forName: $0) }
        
        
        
        
        // if it's only fetching all list of clothes saved without any filter, call fetchAllClothesList function.
        guard let searchingList = searchingList else {
            fetchAllClothes(completionQueue: completionQueue, completion: completion)
            return
        }
        
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "Clothes", predicate: predicate)
        
        query.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]
        
        self.privateDB.perform(query, inZoneWith: nil) { results, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }
            
            guard let results = results else {
                DispatchQueue.main.async {
                    let error = NSError(
                        domain: "com.hojin.Clothes", code: -1,
                        userInfo: [NSLocalizedDescriptionKey: "Could not download notes"])
                    completion(.failure(error))
                }
                return
            }
            
            let clothes = results.map(Clothes.init)
            var p1: [Clothes] = []
            p1 = clothes.filter{ clothes in
                
                clothes.fabric == "fabric" || searchingList.contains(where: { (clothes.specials ?? []).contains( $0 ) })
                //                    (clothes.specials ?? [] ).map{ $0.id }.contains(array: tec)
                
            }
            
            completionQueue.async {
                
                completion(.success(p1))
                
            }
        }
    }
    
    
    /// Fetches _all_ contact names from the database.
    /// - Parameters:
    ///   - completionQueue: The [DispatchQueue](https://developer.apple.com/documentation/dispatch/dispatchqueue) on which the completion handler will be called. Defaults to `main`.
    ///   - completion: Handler called on operation completion with success (array of names) or failure.
    func fetchAllClothes(completionQueue: DispatchQueue = .main, completion: @escaping (Result<[Clothes], Error>) -> Void) {
        
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "Clothes", predicate: predicate)
        
        query.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]
        
        self.privateDB.perform(query, inZoneWith: nil) { results, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }
            
            guard let results = results else {
                DispatchQueue.main.async {
                    let error = NSError(
                        domain: "com.hojin.Clothes", code: -1,
                        userInfo: [NSLocalizedDescriptionKey: "Could not download notes"])
                    completion(.failure(error))
                }
                return
            }
            
            let clothes = results.map(Clothes.init)
            
            completionQueue.async {
                
                completion(.success(clothes))
                
            }
        }
    }
    
    /// To update a clothes record.
    /// - Parameters:
    ///   - clothes: A specific clothes object that will be updated.
    func updateClothes(clothes: Clothes){
        
        guard let auxID = clothes.id else {return}
        
        self.privateDB.fetch(withRecordID: auxID) { updateRecord, error in
            
            if error == nil {
                guard let auxUpdateRecordID = updateRecord else {return}
                
                auxUpdateRecordID.setValue(clothes.image, forKey: "image")
                auxUpdateRecordID.setValue(clothes.color, forKey: "color")
                auxUpdateRecordID.setValue(clothes.filters, forKey: "filters")
                auxUpdateRecordID.setValue(clothes.seasons, forKey: "seasons")
                auxUpdateRecordID.setValue(clothes.specials, forKey: "specials")
                auxUpdateRecordID.setValue(clothes.type, forKey: "type")
                auxUpdateRecordID.setValue(clothes.subType, forKey: "subType")
                auxUpdateRecordID.setValue(clothes.warm?.rawValue ?? 0, forKey: "warm")
                auxUpdateRecordID.setValue(clothes.confort?.rawValue ?? 0, forKey: "confort")
                auxUpdateRecordID.setValue(clothes.fabric, forKey: "fabric")
                auxUpdateRecordID.setValue(clothes.brand, forKey: "brand")
                auxUpdateRecordID.setValue(clothes.gender, forKey: "gender")
                
                
                self.privateDB.save(auxUpdateRecordID) { (savedRecord, error) in
                    
                    if let error = error{
                        print(error.localizedDescription)
                        return
                    }
                    print("clothes updated")
                }
            }
        }
    }
    
    /// To create new clothes record.
    /// - Parameters:
    ///   - clothes: A clothes object with all values to store in private Database.
    ///   - completion: An optional handler to return a flag (bool) to inidcate operation `finished` and process completion `success` or `failure`.
    func createNewClothes(clothes: Clothes, completion: ((Bool) -> Void)? = nil) {
        
        let newClothesRecord = CKRecord(recordType: "Clothes")
        
        newClothesRecord["image"] = clothes.image
        newClothesRecord["color"] = clothes.color
        newClothesRecord["filters"] = clothes.filters
        newClothesRecord["seasons"] = clothes.seasons
        newClothesRecord["specials"] = clothes.specials
        newClothesRecord["warm"] = clothes.warm?.rawValue ?? 0
        newClothesRecord["confort"] = clothes.confort?.rawValue ?? 0
        newClothesRecord["type"] = clothes.type
        newClothesRecord["subType"] = clothes.subType
        newClothesRecord["fabric"] = clothes.fabric
        newClothesRecord["brand"] = clothes.brand
        newClothesRecord["gender"] = clothes.gender
        
        self.privateDB.save(newClothesRecord) { (savedRecord, error) in
            
            guard let _ = savedRecord else {
                completion?(error == nil)
                return
            }
            
            completion?(error == nil)
            if let error = error{
                print(error.localizedDescription)
                return
            }
        }
    }
    
    /// To delete a clothes.
    /// - Parameters:
    ///   - deleteClothes: A clothes that will be deleted.
    func deleteClothes(deleteClothes: CKRecord.ID) {
        
        
        self.privateDB.delete(withRecordID: deleteClothes) { (deletedRecordID, error) in
            
            if error == nil {
                
                print("Clothes Deleted")
                
            } else {
                
                print("Clothes Not Deleted")
                
            }
            
        }
        
    }
    
    // MARK: - Helpers
    private func filteringSearchResults(forName: [String]){
        
    }
    
}
