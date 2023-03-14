//
//  SecondViewController.swift
//  MarvelLab
//
//  Created by Effective on 09.03.2023.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        print("DONE")
        //view.addSubview(imageView)
        imageView.snp.makeConstraints{ maker in
            maker.top.equalToSuperview().inset(40)
            maker.width.equalToSuperview().multipliedBy(0.6)
            maker.height.equalToSuperview().multipliedBy(0.1)
            maker.centerX.equalToSuperview()
        }
        // Do any additional setup after loading the view.
    }
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Toni")
        return imageView
    }()
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
