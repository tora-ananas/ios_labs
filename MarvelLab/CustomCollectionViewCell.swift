//
//  CustomCollectionViewCell.swift
//  MarvelLab
//
//  Created by Effective on 22.02.2023.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CustomCollectionViewCell"
    
    private let myImageView: UIImageView = {
        let imagView = UIImageView()
        //imagView.image = UIImage(named: "venom.jpg")
        //imagView.backgroundColor = .systemPink
        return imagView
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //contentView.backgroundColor = .systemRed
        contentView.addSubview(myImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        myImageView.frame = CGRect(x: 0, y: 0, width: contentView.frame.size.width, height: contentView.frame.size.height)
        myImageView.clipsToBounds = true
        myImageView.contentMode = .scaleAspectFill
    }
    
    
}
