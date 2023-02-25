//
//  TriangleView.swift
//  MarvelLab
//
//  Created by Effective on 21.02.2023.
//

import UIKit

class TriangleView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var path: UIBezierPath!
    
     init() {
         super.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func createTriangle() {
        path = UIBezierPath()
        
        path.move(to: CGPoint(x: 0, y: self.frame.size.height))
        
        path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.size.height * 0.3))
        
        path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
        
        path.close()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    
        self.createTriangle()
        
        //UIColor.green.setFill()
        //path.fill()
    }
        //
        //UIColor.green.setStroke()
        //path.stroke()
    
    func triangleSetFill(_ colorT: UIColor) {
        
        self.createTriangle()
        //backgroundColor = colorT
        UIColor.red.setFill()
        path.fill()
        //colorT.setStroke()
        //path.stroke()

    }
    
    

}
