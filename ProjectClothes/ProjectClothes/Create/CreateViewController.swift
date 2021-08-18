

import UIKit
import CloudKit

class CreateViewController: UIViewController,  UIGestureRecognizerDelegate {
    
    var delegate: UIGestureRecognizerDelegate?
    
    @IBOutlet weak var deleteButton: UIButton!
    
    //    @IBOutlet weak var outButton: UIButton!
    
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var addItem: UIButton!
    
    let mock = MockData()
    var mockClo: [Clothes] = []
    var roupa : Clothes = Clothes.createEmptyClothes()
    var isflag: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addItem.layer.shadowColor = UIColor.gray.cgColor
        addItem.layer.shadowOpacity = 0.3
        addItem.layer.shadowOffset = .zero
        addItem.layer.shadowRadius = 20
        addItem.layer.cornerRadius = 25
        
        deleteButton.layer.shadowColor = UIColor.gray.cgColor
        deleteButton.layer.shadowOpacity = 0.3
        deleteButton.layer.shadowOffset = .zero
        deleteButton.layer.shadowRadius = 20
        deleteButton.layer.cornerRadius = 25
        
        //        outButton.layer.shadowColor = UIColor.gray.cgColor
        //        outButton.layer.shadowOpacity = 0.3
        //        outButton.layer.shadowOffset = .zero
        //        outButton.layer.shadowRadius = 20
        //        outButton.layer.cornerRadius = 25
        
        
        saveButton.layer.shadowColor = UIColor.gray.cgColor
        saveButton.layer.shadowOpacity = 0.3
        saveButton.layer.shadowOffset = .zero
        saveButton.layer.shadowRadius = 20
        saveButton.layer.cornerRadius = 25
        
//        // MARK: - Check iCloud account status
//        CKContainer.default().accountStatus { (accountStatus, error) in
//            switch accountStatus {
//            case .available:
//                print("iCloud Available")
//            case .noAccount:
//                print("No iCloud account")
//
//                self.isflag = true
//
//            case .restricted:
//                print("iCloud restricted")
//            case .couldNotDetermine:
//                print("Unable to determine iCloud status")
//            @unknown default:
//                fatalError()
//            }
//        }
        
        
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DatabaseManager.shared.checkiCloudAccount() { error, logged in
            if error == true {
                if logged {
                    print("yes log")
                } else {
                    print("nolog")
                    DispatchQueue.main.async {
                        DatabaseManager.shared.loggingiCloud(vc: self)
                    }
                }
            }
        }
    }
    // BUTTON
    
    @IBAction func addItem(_ sender: UIButton) {
//        let imageName = "Image2"
//        let image = UIImage(named: imageName)
//        let imageView = UIImageView(image: image!)
//        imageView.frame = CGRect(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height/2, width: 100, height: 200)
//        self.view.addSubview(imageView)
//        let panGesture = UIPanGestureRecognizer(target: self,
//                                                action: #selector(handlePanGesture(_:)))
//        imageView.addGestureRecognizer(panGesture)
//        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(handlePinchGesture(_:)))
//        imageView.addGestureRecognizer(pinchGesture)
//        let rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(handleRotateGesture(_:)))
//        imageView.addGestureRecognizer(rotateGesture)
//
//        imageView.isUserInteractionEnabled = true
        
        
        // MARK: - Filter clothes with filtros
//        DatabaseManager.shared.filterClothesList(searchingList: ["red", "Snow", "rainning"]) { result in
//
//          switch result {
//          case .failure(let error):
//            print("wrong clothes")
//          case .success(let clothes):
//            self.mockClo = clothes
//          }
//            print(self.mockClo)
//        }

        // MARK: - Create new clothes
//        DatabaseManager.shared.createNewClothes(clothes: mock.roupa1) { error in
//            if error == nil {
//                print("hihi")
//            }
//        }
        
        // MARK: - store // load gender
//        print(DatabaseManager.shared.storeGender(userGender: "male"))
//        print(DatabaseManager.shared.loadGender())
        
        // MARK: - Make user to be logged in iCloud account
//        if isflag {
//            let ac = UIAlertController(title: "No iCloud account", message: "You need to be logged in iCloud account.", preferredStyle: .alert)
//            ac.addAction((UIAlertAction(title: "Go to settings", style: .default, handler: { (action) -> Void in
//                    //This will call when you press ok in your alertview
//                guard let settingsUrl = NSURL(string: UIApplication.openSettingsURLString) as URL? else {return}
//                UIApplication.shared.open(settingsUrl)
//                })))
//            ac.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
//            self.present(ac, animated: true)
//        }
        print("button")
        
    }

    
    
    @objc func handlePanGesture(_ gestureRecognizer:UIPanGestureRecognizer){
        if gestureRecognizer.state == .began || gestureRecognizer.state == .changed
        
        {
            let translation = gestureRecognizer.translation(in: view)
            gestureRecognizer.view?.transform = (gestureRecognizer.view?.transform.translatedBy(x: translation.x, y: translation.y))!
            gestureRecognizer.setTranslation(CGPoint(x: 0, y: 0), in: view)
            
            self.view.bringSubviewToFront(gestureRecognizer.view ?? UIView())
            self.view.bringSubviewToFront(addItem ?? UIView())
            //            self.view.bringSubviewToFront(deleteButton ?? UIView())
            self.view.bringSubviewToFront(saveButton ?? UIView())
            //            self.view.bringSubviewToFront(outButton ?? UIView())
            
            if pointIsWithinView(point:gestureRecognizer.location(in: self.view) , view1: deleteButton){
                self.animateView(deleteButton)
                gestureRecognizer.view?.removeFromSuperview()
            }
        }
    }
    
    fileprivate func animateView( _ viewToAnimate: UIView){
        UIView.animateKeyframes(withDuration: 0.3, delay: 0, options: UIView.KeyframeAnimationOptions.allowUserInteraction , animations: {
            viewToAnimate.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        }){ (_) in
            
            print("funcionando")
            UIView.animateKeyframes(withDuration: 1, delay: 0, options: UIView.KeyframeAnimationOptions.allowUserInteraction , animations: {
                viewToAnimate.transform = CGAffineTransform(scaleX: -1, y: -1)
                UIView.animateKeyframes(withDuration: 1, delay: 0, options: UIView.KeyframeAnimationOptions.allowUserInteraction , animations: {
                    viewToAnimate.transform = CGAffineTransform(scaleX: 1, y: 1)
                }, completion: nil)
            },completion: nil)
        }
    }
    
    func pointIsWithinView(point:CGPoint, view1:UIView ) -> Bool{
        
        
        return view1.frame.contains(point)
    }
    
    @objc func handlePinchGesture(_ gestureRecognizer:UIPinchGestureRecognizer){
        if gestureRecognizer.state == .began || gestureRecognizer.state == .changed
        {
            gestureRecognizer.view?.transform = (gestureRecognizer.view?.transform.scaledBy(x: gestureRecognizer.scale, y: gestureRecognizer.scale))!
            gestureRecognizer.scale = 1.0;
        }
    }
    
    @objc func handleRotateGesture(_ gestureRecognizer:UIRotationGestureRecognizer){
        if gestureRecognizer.state == .began || gestureRecognizer.state == .changed
        {
            gestureRecognizer.view?.transform = (gestureRecognizer.view?.transform.rotated(by: gestureRecognizer.rotation))!
            gestureRecognizer.rotation = 0.0;
            
            
            
        }
    }
    
    
    /// IMAGE ROTATION & IMAGE SCALE
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool
    {
        return true
    }
    
    
    
    /// ALLOW SIMULTANEOUS GESTURES DELEGATE
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
}

/// SAVE PNG AND SEND TO LOOKs


