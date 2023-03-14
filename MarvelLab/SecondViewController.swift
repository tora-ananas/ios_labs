//
//  SecondViewController.swift
//  MarvelLab
//
//  Created by Effective on 09.03.2023.
//

import UIKit

final class SecondViewController: UIViewController {

    struct Model {
        let image: UIImage
        let name: String
        let description: String
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setLayout()
        setConstraints()
    }
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var heroNameLabel: UILabel = {
        let heroNameLabel = UILabel()
        heroNameLabel.font = UIFont(name: "GillSans-Bold", size: 26)
        heroNameLabel.textColor = .white
        heroNameLabel.translatesAutoresizingMaskIntoConstraints = false
        heroNameLabel.textAlignment = NSTextAlignment.center
        return heroNameLabel
    }()
    
    private lazy var descriptionTextView: UITextView = {
        let descriptionTextView = UITextView()
        descriptionTextView.font = UIFont(name: "GillSans-Bold", size: 24)
        descriptionTextView.textColor = .white
        descriptionTextView.textAlignment = NSTextAlignment.center
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextView.contentInsetAdjustmentBehavior = .automatic
        descriptionTextView.isEditable = false
        descriptionTextView.backgroundColor = .clear
        return descriptionTextView
    }()
    
    private func setLayout() {
        view.addSubview(imageView)
        view.addSubview(heroNameLabel)
        view.addSubview(descriptionTextView)
    }
    
    private func setConstraints() {
        
        heroNameLabel.snp.makeConstraints { maker in
            maker.top.equalTo(view.snp.centerY).multipliedBy(1.4)
            maker.leading.trailing.equalToSuperview()
            //maker.left.equalToSuperview().inset(20)
            //maker.centerX.equalToSuperview()
            //maker.bottom.equalTo(descriptionTextView).inset(20)
        }
        
        descriptionTextView.snp.makeConstraints{ maker in
            maker.top.equalTo(heroNameLabel).inset(40)
            maker.bottom.equalToSuperview()
            maker.left.right.equalToSuperview().inset(20)
            maker.height.equalToSuperview().multipliedBy(0.2)
        }
        
        imageView.snp.makeConstraints{ maker in
            maker.edges.equalToSuperview()
        }
        
        
    }
    
    
    
    func setup(with model: Model){
        imageView.image = model.image
        heroNameLabel.text = model.name
        descriptionTextView.text = model.description
    }

}
