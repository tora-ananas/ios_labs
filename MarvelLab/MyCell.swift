//
//  MyCell.swift
//  MarvelLab
//
//  Created by Effective on 08.03.2023.
//

import UIKit

final class MyCell: UICollectionViewCell {

    struct Model {
        let name: String
        let image: UIImage
    }
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
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
    }
    
    private func setLayout() {
        contentView.addSubview(imageView)
        contentView.addSubview(heroNameLabel)
    }
    
    private func setConstraints() {
        heroNameLabel.snp.makeConstraints { maker in
            maker.bottom.equalToSuperview().inset(20)
            maker.left.right.equalToSuperview().inset(20)
        }
        
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setup(with model: Model){
        imageView.image = model.image
        heroNameLabel.text = model.name
    }
}
