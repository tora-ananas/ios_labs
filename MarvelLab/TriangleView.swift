//
//  TriangleView.swift
//  MarvelLab
//
//  Created by Effective on 21.02.2023.
//

import UIKit

final class TriangleView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    private var path: UIBezierPath?
    private var colorTriangle: UIColor
    
     init() {
         self.colorTriangle = UIColor(red: 137/255, green: 144/255, blue: 244/255, alpha: 1)
         super.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.colorTriangle = .clear
        super.init(coder: aDecoder)
    }
    
    func createTriangle() {
        path = UIBezierPath()
        
        path?.move(to: CGPoint(x: 0, y: self.frame.size.height))
        
        path?.addLine(to: CGPoint(x: self.frame.width, y: self.frame.size.height * 0.4))
        
        path?.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
        
        path?.close()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.createTriangle()
        colorTriangle.setFill()
        path?.fill()
        colorTriangle.setStroke()
        path?.stroke()
        
    }
    
    func triangleSetFill(_ colorT: UIColor) {
        colorTriangle = colorT
        setNeedsDisplay()
    }
    
    
    

}
