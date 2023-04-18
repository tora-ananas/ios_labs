//
//  MyCell.swift
//  MarvelLab
//
//  Created by Effective on 08.03.2023.
//

import UIKit
import Kingfisher

final class MyCell: UICollectionViewCell {

    struct Model {
        let name: String
        let image: URL?
    }
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 30
        return imageView
    }()
    
    private lazy var characterNameLabel: UILabel = {
        let charNameLabel = UILabel()
        charNameLabel.font = UIFont(name: "Futura-Bold", size: 26)
        charNameLabel.textColor = .white
        return charNameLabel
        
    }()
            
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
        setConstraints()
    }
    
    private func setLayout() {
        contentView.addSubview(imageView)
        contentView.gradient(colors: [UIColor.clear.cgColor, UIColor.black.cgColor], startPoint: CGPoint.init(x: 0.5, y: 0.0), endPoint: CGPoint.init(x: 0.5, y: 1.0), opacity: 0.5, location: [0,1], cornerRadius: 30)
        contentView.addSubview(characterNameLabel)
    }
    
    private func setConstraints() {
        characterNameLabel.snp.makeConstraints { maker in
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
        imageView.kf.setImage(with: model.image)
        characterNameLabel.text = model.name
    }
}
