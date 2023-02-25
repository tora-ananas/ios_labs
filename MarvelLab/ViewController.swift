//
//  ViewController.swift
//  MarvelLab
//
//  Created by Effective on 20.02.2023.
//

import SnapKit
import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        triangleView.triangleSetFill(colors[indexPath.item])
        //triangleView.triangleSetFill(.red)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        let pic = pics[indexPath.item]
        let imagView = UIImageView()
        imagView.image = UIImage(named: pic)
        cell.contentView.addSubview(imagView)
        imagView.frame = CGRect(x: 0, y: 0, width: cell.contentView.frame.size.width, height: cell.contentView.frame.size.height)
        imagView.clipsToBounds = true
        imagView.contentMode = .scaleAspectFill
        
        return cell
    }
    
    
    let cellWidth = (3 / 4) * UIScreen.main.bounds.width
    let cellHeight = (4 / 7) * UIScreen.main.bounds.height
    let sectionSpacing = (1 / 8) * UIScreen.main.bounds.width
    let colors: [UIColor] = [UIColor(red: 170/255, green: 40/255, blue: 78/255, alpha: 1),
                             UIColor(red: 80/255, green: 58/255, blue: 115/255, alpha: 1),
                             UIColor(red: 187/255, green: 14/255, blue: 103/255, alpha: 1),
                             UIColor(red: 238/255, green: 212/255, blue: 10/255, alpha: 1),
                             UIColor(red: 181/255, green: 40/255, blue: 88/255, alpha: 1),
                             UIColor(red: 204/255, green: 9/255, blue: 10/255, alpha: 1),
                             UIColor(red: 226/255, green: 33/255, blue: 33/255, alpha: 1),
                             UIColor(red: 238/255, green: 92/255, blue: 41/255, alpha: 1)]
    let pics: [String] = ["venom", "tonistark", "Thor", "Loki", "Vision", "vanda", "Deadpool", "Doc"]
    let cellId = "cell id"
    let backgroundColor = UIColor(red: 42/255, green: 39/255, blue: 43/255, alpha: 1)
    
    private lazy var collectionView: UICollectionView = {
        let layout = PagingCollectionViewLayout()
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: sectionSpacing, bottom: 0, right: sectionSpacing)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.decelerationRate = .fast
        collectionView.dataSource = self
        collectionView.delegate = self
        
        return collectionView
     
    }()
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "marvel.png")
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Choose your hero!"
        label.font = UIFont(name: "GillSans-Bold", size: 26)
        //label.font = UIFont.boldSystemFont(ofSize: 26)
        label.textColor = .white
        return label
    }()
    
    private let triangleView = TriangleView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        //configure()
    }
    
    //private func configure() {
    //    var imageView = logoImageView
    //    let x = view.frame.size.width / 2
    //    let y = view.frame.size.height * 0.1
    //    let widthImage = view.frame.size.width / 3
    //    let heightImage = view.frame.size.height / 16
    //    imageView = UIImageView(frame: CGRect(x: x - (widthImage / 2), y: y, width: widthImage, height: heightImage))
    //}
    
    private func setLayout() {
        // addSubview
        view.backgroundColor = backgroundColor
        view.addSubview(triangleView)
        view.addSubview(collectionView)
        view.addSubview(logoImageView)
        view.addSubview(titleLabel)
        
        triangleView.snp.makeConstraints{ maker in
            maker.top.equalToSuperview()
            maker.left.equalToSuperview()
            maker.right.equalToSuperview()
            maker.bottom.equalToSuperview()
            
        }
        triangleView.backgroundColor = backgroundColor
        
        logoImageView.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.top.equalToSuperview().inset(view.frame.size.height * 0.08)
            maker.width.equalTo(view.frame.size.width / 3)
            maker.height.equalTo(view.frame.size.height / 16)
        }
                
        titleLabel.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(logoImageView).inset(50)
            
        }
        
        //collectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        //collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        //collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        //collectionView.heightAnchor.constraint(equalToConstant: cellHeight).isActive = true
        //collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        
        collectionView.snp.makeConstraints { maker in
            maker.leading.equalToSuperview()
            maker.trailing.equalToSuperview()
            maker.height.equalTo(cellHeight)
            maker.top.equalTo(titleLabel).inset(70)
        }
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        
        //NSLayoutConstraint.activate([
        //    triangleView.topAnchor.constraint(equalTo: view.centerYAnchor),
        //    triangleView.leftAnchor.constraint(equalTo: view.leftAnchor),
        //    triangleView.rightAnchor.constraint(equalTo: view.rightAnchor),
        //    triangleView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        //])
        
        //constaints
    }

}
