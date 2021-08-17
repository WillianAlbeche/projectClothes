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
    
    /// For iCloud account status
    var isLoggedIn: Bool = false
    
    //------------------------------------------------
    // MARK: - API (Clothes)
    
    /// To filter out clothes in a user's wardrobe.
    /// - Parameters:
    ///   - completion: A handler to process completion `success` or `failure`.
    func filterClothesList( searchingList: [String]?, completionQueue: DispatchQueue = .main, _ completion: @escaping (Result<[Clothes], Error>) -> Void) {
        
        //        let searchUp = searchingList.map { filteringSearchResults(forName: $0) }
        // if it's only fetching all list of clothes saved without any filter, call fetchAllClothes function.
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
            
            let clothesList = results.map(Clothes.init)
            var auxClothesList: [Clothes] = []
            auxClothesList = clothesList.filter{ clothes in
                
                searchingList.contains(where: { (clothes.filters ?? []).contains( $0 ) }) ||
                searchingList.contains(where: { (clothes.seasons ?? []).contains( $0 ) }) ||
                searchingList.contains(where: { (clothes.specials ?? []).contains( $0 ) }) ||
                searchingList.contains(where: { (clothes.color ?? "").contains( $0 ) })
                //                    (clothes.specials ?? [] ).map{ $0.id }.contains(array: tec)
                
            }
            
            completionQueue.async {
                
                completion(.success(auxClothesList))
                
            }
        }
    }
    
    
    /// Fetches _all_ clothes from the database.
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
        
        guard let auxid = clothes.id else {
            print("recordid")
            return}
        let newClothesRecord = CKRecord(recordType: "Clothes", recordID: auxid)
        
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
                print( "not saved")
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
    
    //------------------------------------------------
    // MARK: - API (Look)
    /// To create new look record.
    /// - Parameters:
    ///   - look: A look object with all values to store in private Database.
    ///   - completion: An optional handler to return a flag (bool) to inidcate operation `finished` and process completion `success` or `failure`.
    func createNewLook(look: Look, completion: ((Bool) -> Void)? = nil) {
        
        let newLookRecord = CKRecord(recordType: "Look")
        
        newLookRecord["image"] = look.image
        newLookRecord["filters"] = look.filters
        
        self.privateDB.save(newLookRecord) { (savedRecord, error) in
            
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
    
    /// To filter out clothes in a user's wardrobe.
    /// - Parameters:
    ///   - completion: A handler to process completion `success` or `failure`.
    func filterLookList( searchingList: [String]?, completionQueue: DispatchQueue = .main, _ completion: @escaping (Result<[Look], Error>) -> Void) {
        
        //        let searchUp = searchingList.map { filteringSearchResults(forName: $0) }
        
        
        // if it's only fetching all list of looks saved without any filter, call fetchAllLooks function.
        guard let searchingList = searchingList else {
            fetchAllLooks(completionQueue: completionQueue, completion: completion)
            return
        }
        
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "Look", predicate: predicate)
        
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
                        userInfo: [NSLocalizedDescriptionKey: "Could not download"])
                    completion(.failure(error))
                }
                return
            }
            
            let looksList = results.map(Look.init)
            var auxLook: [Look] = []
            auxLook = looksList.filter{ look in
                
                searchingList.contains(where: { (look.filters ?? []).contains( $0 ) })
                
            }
            
            completionQueue.async {
                
                completion(.success(auxLook))
                
            }
        }
    }
    
    
    /// Fetches _all_ looks from the database.
    /// - Parameters:
    ///   - completionQueue: The [DispatchQueue](https://developer.apple.com/documentation/dispatch/dispatchqueue) on which the completion handler will be called. Defaults to `main`.
    ///   - completion: Handler called on operation completion with success (array of names) or failure.
    func fetchAllLooks(completionQueue: DispatchQueue = .main, completion: @escaping (Result<[Look], Error>) -> Void) {
        
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "Look", predicate: predicate)
        
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
                        userInfo: [NSLocalizedDescriptionKey: "Could not download"])
                    completion(.failure(error))
                }
                return
            }
            
            let looks = results.map(Look.init)
            
            completionQueue.async {
                
                completion(.success(looks))
                
            }
        }
    }
    
    /// To update a look record.
    /// - Parameters:
    ///   - look: A specific look object that will be updated.
    func updateLook(look: Look){
        
        guard let auxID = look.id else {return}
        
        self.privateDB.fetch(withRecordID: auxID) { updateRecord, error in
            
            if error == nil {
                guard let auxUpdateRecordID = updateRecord else {return}
                
                auxUpdateRecordID.setValue(look.image, forKey: "image")
                auxUpdateRecordID.setValue(look.filters, forKey: "filters")
                
                
                self.privateDB.save(auxUpdateRecordID) { (savedRecord, error) in
                    
                    if let error = error{
                        print(error.localizedDescription)
                        return
                    }
                    print("Look updated")
                }
            }
        }
    }
    
    /// To delete a look.
    /// - Parameters:
    ///   - deleteLook: A look that will be deleted.
    func deleteLook(deleteLook: CKRecord.ID) {
        
        
        self.privateDB.delete(withRecordID: deleteLook) { (deletedRecordID, error) in
            
            if error == nil {
                
                print("Look Deleted")
                
            } else {
                
                print("Look Not Deleted")
                
            }
            
        }
        
    }
    
    //------------------------------------------------
    // MARK: - API (Gender)
    /// To store user's gender.
    /// - Parameters:
    ///   - userGender: user's gender to be able to show all types of clothes which conform to that gender.
    func storeGender(userGender: String) -> Bool {
        
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(userGender) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: "gender")
            return true
        }
        return false
    }
    
    /// To load user's gender.
    func loadGender() -> String {
        if let savedDay = UserDefaults.standard.data(forKey: "gender") {
            let decoder = JSONDecoder()
            if let loadedDay = try? decoder.decode(String.self, from: savedDay) {
                return loadedDay
            }
        }
        return ""
    }
    
    //------------------------------------------------
    // MARK: - Helper
    /// To check iCloud account status
    func checkiCloudAccount(){
        CKContainer.default().accountStatus { (accountStatus, error) in
            switch accountStatus {
            case .available:
                print("iCloud Available")
                self.isLoggedIn = true
            case .noAccount:
                print("No iCloud account")
                self.isLoggedIn = false
            case .restricted:
                print("iCloud restricted")
            case .couldNotDetermine:
                print("Unable to determine iCloud status")
            @unknown default:
                fatalError()
            }
        }
    }
    
    /// To make user to log in iCloud account
    func neediCloudLoggedIn(vc: UIViewController){
        if !self.isLoggedIn {
            let ac = UIAlertController(title: "No iCloud account", message: "You need to be logged in iCloud account.", preferredStyle: .alert)
            ac.addAction((UIAlertAction(title: "Go to settings", style: .default, handler: { (action) -> Void in
                    //This will call when you press ok in your alertview
                guard let settingsUrl = NSURL(string: UIApplication.openSettingsURLString) as URL? else {return}
                UIApplication.shared.open(settingsUrl)
                })))
            ac.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
            vc.present(ac, animated: true)
        }

    }
}
