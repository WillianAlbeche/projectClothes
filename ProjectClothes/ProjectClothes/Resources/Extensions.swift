//
//  Extensions.swift
//  ProjectClothes
//
//  Created by Hojin Ryu on 02/08/21.
//

import Foundation
import CloudKit
import UIKit


extension CKAsset {
    func toUIImage() -> UIImage? {
        if let data = NSData(contentsOf: self.fileURL!) {
            return UIImage(data: data as Data)
        }
        return nil
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
