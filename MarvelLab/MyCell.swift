//
//  MyCell.swift
//  MarvelLab
//
//  Created by Effective on 08.03.2023.
//

import UIKit

final class MyCell: UICollectionViewCell {
    private var view: UIView = {
       let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 30
        return imageView
    }()
            
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        view.addSubview(imageView)
        contentView.addSubview(view)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func changeImage(imageName: String){
        imageView.image = UIImage(named: imageName)
    }
}
