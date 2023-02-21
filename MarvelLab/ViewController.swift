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
    let colors: [UIColor] = [.red, .orange, .yellow, .green, .blue, .purple, .systemPink, .systemRed]
    let pics: [String] = ["venom", "tonistark", "Thor", "Loki", "Vision", "vanda", "Deadpool", "Doc"]
    let cellId = "cell id"
    let backgroundColor = UIColor(red: 42/255, green: 39/255, blue: 43/255, alpha: 1)
    
    /*lazy var collectionView: UICollectionView = {
        let layout = PagingCollectionViewLayout()
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: sectionSpacing, bottom: 0, right: sectionSpacing)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = backgroundColor
        collectionView.decelerationRate = .fast
        collectionView.dataSource = self
        collectionView.delegate = self
        
        return collectionView
    }()*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        
        let layout = PagingCollectionViewLayout()
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: sectionSpacing, bottom: 0, right: sectionSpacing)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = backgroundColor
        collectionView.decelerationRate = .fast
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        
        collectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: cellHeight).isActive = true

        //triangle()
        // Do any additional setup after loading the view.
    }
    
    private func initialize() {
        view.backgroundColor = backgroundColor
        
        let imageName = "marvel.png"
        let x = view.frame.size.width / 2
        let y = view.frame.size.height * 0.1
        let widthImage = view.frame.size.width / 3
        let heightImage = view.frame.size.height / 16
        let marvelLogo = UIImageView(frame: CGRect(x: x - (widthImage / 2), y: y, width: widthImage, height: heightImage))
        
        marvelLogo.image = UIImage(named: imageName)
        view.addSubview(marvelLogo)
        /*marvelLogo.snp.makeConstraints{ maker in
            maker.centerX.equalToSuperview()
            maker.top.equalToSuperview().inset(100)
        }*/
        
        
        
        
        //Futura-Bold GillSans-Bold ChalkboardSE-Bold
        let label = UILabel()
        label.text = "Choose your hero!"
        label.font = UIFont(name: "GillSans-Bold", size: 26)
        //label.font = UIFont.boldSystemFont(ofSize: 26)
        label.textColor = .white

        view.addSubview(label)
        label.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(marvelLogo).inset(50)
            
        }
        
        
        
        /*let imageNameVenom = "venom.jpg"
        let xVenom = view.frame.size.width / 2
        let yVenom = view.frame.size.height / 3
        let widthVenom = view.frame.size.width - 100
        let heightVenom = view.frame.size.height / 3
        let marvelVenom = UIImageView(frame: CGRect(x: xVenom - (widthVenom / 2), y: yVenom, width: widthVenom, height: heightVenom))
        marvelVenom.image = UIImage(named: imageNameVenom)
        marvelVenom.contentMode = .scaleAspectFit
        view.addSubview(marvelVenom)*/
        
    }
    
    /*private func triangle() {
        let width: CGFloat = view.frame.size.width
        let height: CGFloat = view.frame.size.height
        
        let triangleView = TriangleView(frame: CGRect(x: 0, y: view.frame.size.height/2, width: width, height: height) )
        triangleView.backgroundColor = backgroundColor
        view.addSubview(triangleView)
    }*/
    


}

