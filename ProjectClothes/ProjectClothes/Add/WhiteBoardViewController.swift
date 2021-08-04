//
//  WhiteBoardViewController.swift
//  ProjectClothes
//
//  Created by Heitor Feijó Kunrath on 03/08/21.
//

import UIKit


import UIKit
import CoreML

class WhiteBoardViewController: UIViewController {
    
    @IBOutlet var editView: DrawingView!
    @IBOutlet weak var nextButton: UIButton!
    var image1: UIImage?
    @IBAction func nextButtonAction(_ sender: Any) {
        
        let renderer = UIGraphicsImageRenderer(size: editView.bounds.size)
        image1 = renderer.image { ctx in
            editView.drawHierarchy(in: editView.bounds, afterScreenUpdates: true)
        }
        
        performSegue(withIdentifier: "goToConfig", sender: image1)
    }
    @IBOutlet weak var iaButton: UIButton!
    @IBAction func iaButtonAction(_ sender: Any) {
    }
    var imagenew: UIImage?
    var imageReceive : UIImage?

    let rotation = UIRotationGestureRecognizer()
    let pinch = UIPinchGestureRecognizer()
    let pan = UIPanGestureRecognizer()
    
    var flagRotate = false
    var flagPinch = false
    var flagPan = false
    
    var lastScale = CGFloat()
    var initialCenter = CGPoint()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagenew = imageReceive
        guard let newImage = imagenew?.removeBackground(returnResult: .finalImage) else { return }
        
        
        self.editView.image = newImage
        
        //        //Rotation
//                let rotation = UIRotationGestureRecognizer()
        //        rotation.addTarget(self, action: #selector(handleRotateGesture))
        //        self.editView.addGestureRecognizer(rotation)
        
        //        //Pinch
        //        let pinch = UIPinchGestureRecognizer()
        //        pinch.addTarget(self, action: #selector(handlePinchGesture))
        //        self.editView.addGestureRecognizer(pinch)
        
        //        //Pan
        //        let pan = UIPanGestureRecognizer()
        //        pan.addTarget(self, action: #selector(handlePanGesture))
        //        self.editView.addGestureRecognizer(pan)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? ClothesConfigurationViewController
        if segue.identifier == "goToConfig" {
            destination?.imageReceive = image1
        }
    }
    
    
    
    @objc func handlePinchGesture(_ recognizer: UIPinchGestureRecognizer) {
        if recognizer.state == .began {
            lastScale = recognizer.scale
        }
        if let pinchView = recognizer.view, recognizer.state == .began || recognizer.state == .changed
        {
            let currentScale = pinchView.layer.value(forKeyPath: "transform.scale") as? CGFloat
            let kMaxScale:CGFloat = 2.0
            let kMinScale:CGFloat = 0.7
            
            var newScale = 1.0 - (lastScale - recognizer.scale)
            if let currentScale = currentScale {
                newScale = min(newScale, kMaxScale / currentScale)
                newScale = max(newScale, kMinScale / currentScale)
                pinchView.transform = pinchView.transform.scaledBy(x: newScale, y: newScale)
                recognizer.scale = 1.0
                lastScale = recognizer.scale
                
            }
        }
    }
    
    @objc func handleRotateGesture(_ recognizer: UIRotationGestureRecognizer){
        
        print("hihi")
        if recognizer.state == .began{
            print("began")
            view.backgroundColor = UIColor.cyan
        }
        if recognizer.state == .changed{
            print("changed")
            
            print(String(format:"rotation: %1.3f",recognizer.rotation))
            editView.transform = editView.transform.rotated(by: recognizer.rotation)
            recognizer.rotation = 0
        }
        if recognizer.state == .ended{
            print("ended")
            view.backgroundColor = UIColor.systemRed
        }
        
    }
    
    @objc func handlePanGesture(_ recognizer: UIPanGestureRecognizer){
        
        guard let piece = recognizer.view else {return}
        // Get the changes in the X and Y directions relative to
        // the superview's coordinate space.
        let translation = recognizer.translation(in: piece.superview)
        if recognizer.state == .began {
            // Save the view's original position.
            self.initialCenter = piece.center
        }
        // Update the position for the .began, .changed, and .ended states
        if recognizer.state != .cancelled {
            // Add the X and Y translation to the view's original position.
            let newCenter = CGPoint(x: initialCenter.x + translation.x, y: initialCenter.y + translation.y)
            piece.center = newCenter
        }
        else {
            // On cancellation, return the piece to its original location.
            piece.center = initialCenter
        }
        
    }
    
    //rotate
    @IBAction func button1(_ sender: Any) {
        self.editView.isEraserSelected = false
        //Rotation
//        let rotation = UIRotationGestureRecognizer()
        rotation.addTarget(self, action: #selector(handleRotateGesture))
        self.editView.addGestureRecognizer(rotation)
        flagRotate = true
        self.editView.removeGestureRecognizer(pinch)
        self.editView.removeGestureRecognizer(pan)
        
    }
    
    //pinch
    @IBAction func button2(_ sender: Any) {
        
        self.editView.isEraserSelected = false
        //Pinch
//        let pinch = UIPinchGestureRecognizer()
        pinch.addTarget(self, action: #selector(handlePinchGesture))
        self.editView.addGestureRecognizer(pinch)
        flagPinch = true
        self.editView.removeGestureRecognizer(rotation)
        self.editView.removeGestureRecognizer(pan)
        
    }
    
    //eraserTool
    @IBAction func eraseButton(_ sender: Any) {
        
        //        guard let editView = editView else {return}
        
        
        flagRotate = false
        flagPinch = false
        flagPan = false
        self.editView.removeGestureRecognizer(rotation)
        self.editView.removeGestureRecognizer(pinch)
        self.editView.removeGestureRecognizer(pan)
        
//        if self.editView.gestureRecognizers?.count == nil {
//            print("recog 0")
//            self.editView.isEraserSelected = true
//        } else {
//
//            self.editView.isEraserSelected = true
//        }
        if self.editView.isEraserSelected == true {
            self.editView.isEraserSelected = false
        } else {
            self.editView.isEraserSelected = true
        }
        
    }
    
    //pan
    @IBAction func nextButton(_ sender: Any) {
        //        if let vc = storyboard?.instantiateViewController(identifier: "edited") as? EditedViewController {
        //            vc.edited = self.editView.image
        //
        //            navigationController?.pushViewController(vc, animated: true)
        //        }
        
        //        //Panx
        self.editView.isEraserSelected = false
//        let pan = UIPanGestureRecognizer()
        pan.addTarget(self, action: #selector(handlePanGesture))
        self.editView.addGestureRecognizer(pan)
        flagPan = true
        self.editView.removeGestureRecognizer(rotation)
        self.editView.removeGestureRecognizer(pinch)
        
    }
}



// Don't forget to add to the project:
// 1. DeepLabV3 - https://developer.apple.com/machine-learning/models/
// 2. CoreMLHelpers - https://github.com/hollance/CoreMLHelpers
enum RemoveBackroundResult {
    case background
    case finalImage
}

extension UIImage {
    
    func removeBackground(returnResult: RemoveBackroundResult) -> UIImage? {
        guard let model = getDeepLabV3Model() else { return nil }
        let width: CGFloat = 513
        let height: CGFloat = 513
        let resizedImage = resized(to: CGSize(width: height, height: height), scale: 1)
        guard let pixelBuffer = resizedImage.pixelBuffer(width: Int(width), height: Int(height)),
              let outputPredictionImage = try? model.prediction(image: pixelBuffer),
              let outputImage = outputPredictionImage.semanticPredictions.image(min: 0, max: 1, axes: (0, 0, 1)),
              let outputCIImage = CIImage(image: outputImage),
              let maskImage = outputCIImage.removeWhitePixels(),
              let maskBlurImage = maskImage.applyBlurEffect() else { return nil }
        
        switch returnResult {
        case .finalImage:
            guard let resizedCIImage = CIImage(image: resizedImage),
                  let compositedImage = resizedCIImage.composite(with: maskBlurImage) else { return nil }
            let finalImage = UIImage(ciImage: compositedImage)
                .resized(to: CGSize(width: size.width, height: size.height))
            return finalImage
        case .background:
            let finalImage = UIImage(
                ciImage: maskBlurImage,
                scale: scale,
                orientation: self.imageOrientation
            ).resized(to: CGSize(width: size.width, height: size.height))
            return finalImage
        }
    }
    
    private func getDeepLabV3Model() -> DeepLabV3? {
        do {
            let config = MLModelConfiguration()
            return try DeepLabV3(configuration: config)
        } catch {
            print("Error loading model: \(error)")
            return nil
        }
    }
    
}


extension CIImage {
    
    func removeWhitePixels() -> CIImage? {
        let chromaCIFilter = chromaKeyFilter()
        chromaCIFilter?.setValue(self, forKey: kCIInputImageKey)
        return chromaCIFilter?.outputImage
    }
    
    func composite(with mask: CIImage) -> CIImage? {
        return CIFilter(
            name: "CISourceOutCompositing",
            parameters: [
                kCIInputImageKey: self,
                kCIInputBackgroundImageKey: mask
            ]
        )?.outputImage
    }
    
    func applyBlurEffect() -> CIImage? {
        let context = CIContext(options: nil)
        let clampFilter = CIFilter(name: "CIAffineClamp")!
        clampFilter.setDefaults()
        clampFilter.setValue(self, forKey: kCIInputImageKey)
        
        guard let currentFilter = CIFilter(name: "CIGaussianBlur") else { return nil }
        currentFilter.setValue(clampFilter.outputImage, forKey: kCIInputImageKey)
        currentFilter.setValue(2, forKey: "inputRadius")
        guard let output = currentFilter.outputImage,
              let cgimg = context.createCGImage(output, from: extent) else { return nil }
        
        return CIImage(cgImage: cgimg)
    }
    
    // modified from https://developer.apple.com/documentation/coreimage/applying_a_chroma_key_effect
    private func chromaKeyFilter() -> CIFilter? {
        let size = 64
        var cubeRGB = [Float]()
        
        for z in 0 ..< size {
            let blue = CGFloat(z) / CGFloat(size - 1)
            for y in 0 ..< size {
                let green = CGFloat(y) / CGFloat(size - 1)
                for x in 0 ..< size {
                    let red = CGFloat(x) / CGFloat(size - 1)
                    let brightness = getBrightness(red: red, green: green, blue: blue)
                    let alpha: CGFloat = brightness == 1 ? 0 : 1
                    cubeRGB.append(Float(red * alpha))
                    cubeRGB.append(Float(green * alpha))
                    cubeRGB.append(Float(blue * alpha))
                    cubeRGB.append(Float(alpha))
                }
            }
        }
        
        let data = Data(buffer: UnsafeBufferPointer(start: &cubeRGB, count: cubeRGB.count))
        
        let colorCubeFilter = CIFilter(
            name: "CIColorCube",
            parameters: [
                "inputCubeDimension": size,
                "inputCubeData": data
            ]
        )
        return colorCubeFilter
    }
    
    // modified from https://developer.apple.com/documentation/coreimage/applying_a_chroma_key_effect
    private func getBrightness(red: CGFloat, green: CGFloat, blue: CGFloat) -> CGFloat {
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1)
        var brightness: CGFloat = 0
        color.getHue(nil, saturation: nil, brightness: &brightness, alpha: nil)
        return brightness
    }
    
}


