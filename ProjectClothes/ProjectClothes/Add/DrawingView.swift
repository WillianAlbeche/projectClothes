//
//  DrawingView.swift
//  erasingTool
//
//  Created by Hojin Ryu on 21/07/21.
//

import UIKit

class DrawingView: UIView {
    
    var lineColor:CGColor = UIColor.black.cgColor
    var lineWidth:CGFloat = 5
    var drawingAlpha:CGFloat = 1.0
    
    var isEraserSelected: Bool
//    var drawingNow: Bool
    
    private var currentPoint:CGPoint?
    private var previousPoint1:CGPoint?
    private var previousPoint2:CGPoint?
    
    private var path:CGMutablePath = CGMutablePath()
    
    var image: UIImage?
    
    required init?(coder aDecoder: NSCoder) {
        //self.backgroundColor = UIColor.clearColor()
        self.isEraserSelected = false
//        self.drawingNow = false //additional feature:Hojin
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.clear
        
    }
    
//    override func draw(_ rect: CGRect)
//    {
//        if drawingNow {
//            self.isEraserSelected ? self.eraseMode() : self.drawingMode()
//        }
//
//    }
    func drawingNow(){
        if (self.image != nil)
        {
            self.image!.draw(in: self.bounds)
        }
        
    }
    override func draw( _ rect: CGRect)
    {
        
//        if self.isEraserSelected {
//            self.eraseMode()
//        }
//
        self.isEraserSelected ? self.eraseMode() : self.drawingMode()
        
    }
    
    private func drawingMode()
    {
        if (self.image != nil)
        {
            self.image!.draw(in: self.bounds)
        }
//        let context:CGContext = UIGraphicsGetCurrentContext()!
//        context.addPath(path)
//        context.setLineCap(CGLineCap.round)
//        context.setLineWidth(self.lineWidth)
//        context.setStrokeColor(lineColor)
//        context.setBlendMode(CGBlendMode.normal)
//        context.setAlpha(self.drawingAlpha)
//        context.strokePath();
    }
    
    private func eraseMode()
    {
        if (self.image != nil)
        {
            self.image!.draw(in: self.bounds)
        }
        let context:CGContext = UIGraphicsGetCurrentContext()!
        context.saveGState()
        context.addPath(path);
        context.setLineCap(CGLineCap.round)
        context.setLineWidth(self.lineWidth)
        context.setBlendMode(CGBlendMode.clear)
        context.strokePath()
        context.restoreGState()
    }
    
    private func midPoint (p1:CGPoint, p2:CGPoint)->CGPoint
    {
        return CGPoint(x: (p1.x + p2.x) * 0.5, y: (p1.y + p2.y) * 0.5);
    }
    
    private func finishDrawing()
    {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, 0.0);
        drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        self.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    func clearSignature()
    {
        path = CGMutablePath()
        self.image = nil;
        self.setNeedsDisplay();
    }
    
    // MARK: - Touch Delegates
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        path = CGMutablePath()
        let touch = touches.first!
        previousPoint1 = touch.previousLocation(in: self)
        currentPoint = touch.location(in: self)
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        previousPoint2 = previousPoint1
        previousPoint1 = touch.previousLocation(in: self)
        currentPoint = touch.location(in: self)
        
        let mid1 = midPoint(p1: previousPoint2!, p2: previousPoint1!)
        let mid2 = midPoint(p1: currentPoint!, p2: previousPoint1!)
        
        let subpath:CGMutablePath = CGMutablePath()
        subpath.move(to: CGPoint(x: mid1.x, y: mid1.y), transform: .identity)
        subpath.addQuadCurve(to: CGPoint(x: mid2.x, y: mid2.y), control: CGPoint(x: (previousPoint1?.x)!, y: (previousPoint1?.y)!))
        path.addPath(subpath, transform: .identity)
        
        self.setNeedsDisplay()
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.touchesMoved(touches, with: event)
        self.finishDrawing()
    }
    override func touchesCancelled(_ touches: Set<UITouch>?, with event: UIEvent?) {
        self.touchesMoved(touches!, with: event)
        self.finishDrawing()
    }
}
