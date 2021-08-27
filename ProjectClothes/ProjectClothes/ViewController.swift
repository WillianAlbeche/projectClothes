//
//  ViewController.swift
//  ProjectClothes
//
//  Created by Willian Magnum Albeche on 27/07/21.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("asdfjasdflkasjd;lffasdfasdfasd")
        print("asdfjasdflkasjd;lffasdfasdfasd")
        print("asdfjasdflkasjd;lffasdfasdfasd")
        print("asdfjasdflkasjd;lffasdfasdfasd")
        print(Clothes.all().count)
        print("asdfjasdflkasjd;lffasdfasdfasd")
        print("asdfjasdflkasjd;lffasdfasdfasd")
        print("asdfjasdflkasjd;lffasdfasdfasd")
        print("asdfjasdflkasjd;lffasdfasdfasd")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        Clothes.all().forEach { c in
//            c.destroy()
//        }
        print("count: \(Clothes.all().count)")
        
    }
    @IBAction func save(_ sender: Any) {
        let ac = UIAlertController(title: "Enter the Brand", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let submitAction = UIAlertAction(title: "Submit", style: .default) { [unowned ac] _ in
            let answer = ac.textFields![0]
            // do something interesting with "answer" here
            print(answer.text)
            
            let clothes = Clothes(image: nil, color: "", filters: [], seasons: [], specials: nil, warm: 13, fabric: nil, brand: answer.text, gender: nil, type: "peca", subType: nil)
            
            clothes.save()
            
        
            
        }
        ac.addAction(submitAction)
        present(ac, animated: true)
    }
    
    @IBAction func printing(_ sender: Any) {
        let all = Clothes.all()
        for i in all {
            print("brand: \(i.brand)")
            print("sub1: \(i.subType)")
        }
        print("count: \(all.count)")
        
        performSegue(withIdentifier: "test", sender: nil)
    }
    
    
}

