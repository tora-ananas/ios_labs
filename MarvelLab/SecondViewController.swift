//
//  SecondViewController.swift
//  MarvelLab
//
//  Created by Effective on 09.03.2023.
//

import UIKit
import Kingfisher

final class SecondViewController: UIViewController {

    struct Model {
        let image: URL
        let name: String
        let description: String
    }
    
    private let apiManager = APIManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 213/255, green: 26/255, blue: 45/255, alpha: 1)
        setLayout()
        setConstraints()
    }
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var heroNameLabel: UILabel = {
        let heroNameLabel = UILabel()
        heroNameLabel.font = UIFont(name: "GillSans-Bold", size: 26)
        heroNameLabel.textColor = .white
        heroNameLabel.translatesAutoresizingMaskIntoConstraints = false
        heroNameLabel.textAlignment = .center
        return heroNameLabel
    }()
    
    private lazy var descriptionTextView: UITextView = {
        let descriptionTextView = UITextView()
        descriptionTextView.font = UIFont(name: "GillSans-Bold", size: 24)
        descriptionTextView.textColor = .white
        descriptionTextView.textAlignment = .center
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        //descriptionTextView.contentInsetAdjustmentBehavior = .automatic
        descriptionTextView.isEditable = false
        descriptionTextView.backgroundColor = .clear
        descriptionTextView.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        descriptionTextView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        return descriptionTextView
    }()
    
    private func setLayout() {
        view.gradient(colors: [UIColor.clear.cgColor, UIColor.black.cgColor], startPoint: CGPoint.init(x: 0.5, y: 0.0), endPoint: CGPoint.init(x: 0.5, y: 1.0), opacity: 1, location: [0,1], cornerRadius: 0)
        view.addSubview(imageView)
        view.addSubview(heroNameLabel)
        view.addSubview(descriptionTextView)
    }
    
    private func setConstraints() {
        
        heroNameLabel.snp.makeConstraints {
            $0.bottom.equalTo(descriptionTextView.snp.top)
            $0.left.right.equalToSuperview().inset(20)
        }
        
        descriptionTextView.snp.makeConstraints{ maker in
            maker.bottom.equalToSuperview().inset(20)
            maker.left.right.equalToSuperview().inset(20)
            maker.height.equalToSuperview().multipliedBy(0.1)
        }
        
        imageView.snp.makeConstraints{ maker in
            maker.edges.equalToSuperview()
        }
        
        
    }
    
    
    
    func setup(with model: Model){
        imageView.kf.setImage(with: model.image)
        heroNameLabel.text = model.name
        descriptionTextView.text = model.description
    }


}

