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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func createTriangle() {
        path = UIBezierPath()
        
        path.move(to: CGPoint(x: 0, y: self.frame.size.height))
        
        path.addLine(to: CGPoint(x: self.frame.width, y: 0))
        
        path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
        
        path.close()
    }
    
    override func draw(_ rect: CGRect) {
        self.createTriangle()
        
        UIColor.green.setFill()
        path.fill()
        
        UIColor.green.setStroke()
        path.stroke()
    }
    
    

}
