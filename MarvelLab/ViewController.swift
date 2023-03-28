//
//  ViewController.swift
//  MarvelLab
//
//  Created by Effective on 20.02.2023.
//

import SnapKit
import UIKit
import Kingfisher

final class ViewController: UIViewController, UICollectionViewDelegate {
    
    private let cellWidth = (3 / 4) * UIScreen.main.bounds.width
    private let cellHeight = (3 / 4) * UIScreen.main.bounds.width
    private let sectionSpacing = (1 / 8) * UIScreen.main.bounds.width
    private let colors: [UIColor] = [UIColor(red: 172/255, green: 218/255, blue: 244/255, alpha: 1),
                             UIColor(red: 255/255, green: 244/255, blue: 89/255, alpha: 1),
                             UIColor(red: 0/255, green: 251/255, blue: 194/255, alpha: 1),
                             UIColor(red: 147/255, green: 72/255, blue: 150/255, alpha: 1),
                             UIColor(red: 73/255, green: 146/255, blue: 81/255, alpha: 1),
                             UIColor(red: 91/255, green: 202/255, blue: 231/255, alpha: 1),
                             UIColor(red: 73/255, green: 38/255, blue: 109/255, alpha: 1),
                             UIColor(red: 0/255, green: 178/255, blue: 112/255, alpha: 1),
                             UIColor(red: 16/255, green: 142/255, blue: 187/255, alpha: 1),
                             UIColor(red: 148/255, green: 70/255, blue: 159/255, alpha: 1)]
    
    
    private let cellId = "cell id"
    private let backgroundColor = UIColor(red: 213/255, green: 26/255, blue: 45/255, alpha: 1)
    
    
    
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
        collectionView.layer.shadowColor = UIColor.black.cgColor
        collectionView.layer.shadowOffset = CGSize(width: 10, height: 10)
        collectionView.layer.shadowRadius = 10
        collectionView.layer.shadowOpacity = 10
        //collectionView.contentInset = UIEdgeInsets(top: 50, left: 10, bottom: 50, right: 20)
        return collectionView
     
    }()
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        DispatchQueue.main.async { [self] in
            let url = URL(string: "https://upload.wikimedia.org/wikipedia/ru/thumb/c/c8/Rick_and_Morty_logo.png/320px-Rick_and_Morty_logo.png")
            imageView.downloaded(from: url!)
        }
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Choose your character!"
        label.font = UIFont(name: "Futura-Bold", size: 26)
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
    
    private let apiManager = APIManager()
    
//    override func viewWillAppear(_ animated: Bool) {
  //
    //}


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
        
        apiManager.getCharacter(indexPath: indexPath.item) { [weak self] valuesRickMorty in
            DispatchQueue.main.async {
                //TODO: add "quard let .." with default image when we cant download
                let url = URL(string: valuesRickMorty.image)
                let name = valuesRickMorty.name
                let model = MyCell.Model(name: name, image: url!)
                cell.setup(with: model)
            }
        }
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
        
        apiManager.getCharacter(indexPath: indexPath.item) { [weak self] valuesRickMorty in
            DispatchQueue.main.async {
                let url = URL(string: valuesRickMorty.image)
                let name = valuesRickMorty.name
                let description = valuesRickMorty.species
                let model = SecondViewController.Model(image: url!, name: name, description: description)
                let secondViewController = SecondViewController()
                secondViewController.setup(with: model)
                self?.navigationController?.pushViewController(secondViewController, animated: true)
            }
        }
    }
}

extension UIImageView {
        func downloaded(from url: URL) {
                self.kf.setImage(with: url)
            }
    }

extension UIView {
    func gradient(colors: [CGColor], startPoint: CGPoint, endPoint: CGPoint, opacity: Float, location: [NSNumber]?, cornerRadius: CGFloat) {
            let gradientLayer = CAGradientLayer()
            gradientLayer.frame = bounds
            gradientLayer.colors = colors
            gradientLayer.startPoint = startPoint
            gradientLayer.endPoint = endPoint
            gradientLayer.opacity = opacity
            gradientLayer.locations = location
            gradientLayer.cornerRadius = cornerRadius
            layer.addSublayer(gradientLayer)
        }
}

