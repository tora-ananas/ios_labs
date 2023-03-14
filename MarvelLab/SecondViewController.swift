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
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        view.addSubview(imageView)
        imageView.snp.makeConstraints{ maker in
            maker.edges.equalToSuperview()
        }
    }
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    func setup(with model: Model){
        imageView.image = model.image
    }

}
