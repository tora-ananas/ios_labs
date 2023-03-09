//
//  MyCell.swift
//  MarvelLab
//
//  Created by Effective on 08.03.2023.
//

import UIKit



final class MyCell: UICollectionViewCell {
    /*private var view: UIView = {
       let view = UIView()
        view.backgroundColor = .red
        return view
    }()*/
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 30
        return imageView
    }()
    
    private lazy var heroNameLabel: UILabel = {
        let heroNameLabel = UILabel()
        heroNameLabel.font = UIFont(name: "GillSans-Bold", size: 26)
        heroNameLabel.textColor = .white
        return heroNameLabel
        
    }()
            
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
        setConstraints()
        //contentView.addSubview(view)
        
    }
    
    private func setLayout() {
        contentView.addSubview(imageView)
        contentView.addSubview(heroNameLabel)
    }
    
    private func setConstraints() {
        heroNameLabel.snp.remakeConstraints { maker in
            maker.bottom.equalToSuperview().inset(20)
            maker.left.equalToSuperview().inset(20)        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func changeImageAndLabel(imageName: String){
        imageView.image = UIImage(named: imageName)
        heroNameLabel.text = imageName
    }
}
