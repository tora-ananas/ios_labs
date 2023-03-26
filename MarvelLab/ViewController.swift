//
//  ViewController.swift
//  MarvelLab
//
//  Created by Effective on 20.02.2023.
//

import SnapKit
import UIKit

final class ViewController: UIViewController, UICollectionViewDelegate {
    
    private let cellWidth = (3 / 4) * UIScreen.main.bounds.width
    private let cellHeight = (4.5 / 7) * UIScreen.main.bounds.height
    private let sectionSpacing = (1 / 8) * UIScreen.main.bounds.width
    private let colors: [UIColor] = [UIColor(red: 137/255, green: 144/255, blue: 244/255, alpha: 1),
                             UIColor(red: 249/255, green: 202/255, blue: 77/255, alpha: 1),
                             UIColor(red: 224/255, green: 44/255, blue: 70/255, alpha: 1),
                             UIColor(red: 238/255, green: 212/255, blue: 10/255, alpha: 1),
                             UIColor(red: 226/255, green: 41/255, blue: 104/255, alpha: 1),
                             UIColor(red: 91/255, green: 33/255, blue: 64/255, alpha: 1),
                             UIColor(red: 226/255, green: 33/255, blue: 33/255, alpha: 1),
                             UIColor(red: 235/255, green: 87/255, blue: 41/255, alpha: 1)]
    
    
    private let cellId = "cell id"
    private let backgroundColor = UIColor(red: 42/255, green: 39/255, blue: 43/255, alpha: 1)
    //private var tapGesture = UITapGestureRecognizer()
    
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
        //collectionView.contentInset = UIEdgeInsets(top: 50, left: 10, bottom: 50, right: 20)
        
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
        design()
        registerCollectionViewCells()
        setLayout()

    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        <#code#>
//    }
    

    private func design() {
        view.backgroundColor = backgroundColor
    }
    
    private func registerCollectionViewCells() {
        collectionView.register(MyCell.self, forCellWithReuseIdentifier: cellId)
        }
    
    private func setLayout() {
        // addSubview
        view.addSubview(triangleView)
        view.addSubview(collectionView)
        view.addSubview(logoImageView)
        view.addSubview(titleLabel)
        
        triangleView.snp.makeConstraints{ maker in
            maker.edges.equalToSuperview()
            
        }
        triangleView.backgroundColor = backgroundColor
        
        logoImageView.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(40)
            maker.width.equalToSuperview().multipliedBy(0.6)
            maker.height.equalToSuperview().multipliedBy(0.1)
            maker.centerX.equalToSuperview()
        }
                
        titleLabel.snp.makeConstraints { maker in
            maker.top.equalTo(logoImageView.snp.bottom).offset(20)
            //maker.trailing.leading.equalToSuperview()
            maker.centerX.equalToSuperview()
        }
        
        collectionView.snp.makeConstraints { maker in
            maker.leading.equalToSuperview()
            maker.trailing.equalToSuperview()
            maker.bottom.equalToSuperview()
            maker.top.equalTo(titleLabel.snp.bottom).offset(20)
        }
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? MyCell else {
                return UICollectionViewCell()
        }
        
        let heroData = myHeroData[indexPath.item]
        let name = heroData.name
        let image = heroData.image
        let model = MyCell.Model(name: name, image: image)
        cell.setup(with: model)
        
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let center = self.view.convert(self.collectionView.center, to: self.collectionView)
        guard let index = collectionView.indexPathForItem(at: center) else {
            return
        }
        
        triangleView.triangleSetFill(colors[index.item])
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let heroData = myHeroData[indexPath.item]
        print(heroData)
        let image = heroData.image
        let name = heroData.name
        let description = heroData.text
        let model = SecondViewController.Model(image: image, name: name, description: description)
        let secondViewController = SecondViewController()
        secondViewController.setup(with: model)
        navigationController?.pushViewController(secondViewController, animated: true)
    }
}
