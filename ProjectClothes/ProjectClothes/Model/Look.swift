//
//  Look.swift
//  ProjectClothes
//
//  Created by Hojin Ryu on 11/08/21.
//

import Foundation
import CloudKit

class Look {
    
    let id: CKRecord.ID?
    
    var image: CKAsset?
    var filters: [String]?
    
    private init(){
        let newClothes = CKRecord.init(recordType: "Look")
        id = newClothes.recordID
    }
    
    init(record: CKRecord) {
        id = record.recordID
        
        
        self.image = record["image"] as? CKAsset
        self.filters = record["filters"] as? [String]
        
        
    }
    
    static func createEmptyClothes() -> Look{
        return Look.init()
    }
}
