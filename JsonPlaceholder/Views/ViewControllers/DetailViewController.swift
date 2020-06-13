//
//  DetailViewController.swift
//  JsonPlaceholder
//
//  Created by apple on 2020/6/12.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class DetailViewController: BaseViewController {

    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "placeholder")
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var idLabel: UILabel = {
        let label = UILabel()
        label.text = "id:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "title:"
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var photos: Photos?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpLayout()
        viewModelClosures()
    }
    
    private func setUpLayout() {
        //Main 圖像視圖
        view.addSubview(imageView)
        
        let imageTopAnchor = imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        let imageLeadingAnchor = imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let imageTrailingAnchor = imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        let imageHeightAnchor = imageView.heightAnchor.constraint(equalToConstant: view.bounds.width)
        
        NSLayoutConstraint.activate([imageTopAnchor, imageLeadingAnchor, imageTrailingAnchor, imageHeightAnchor])

        //id 標籤
        view.addSubview(idLabel)
        
        let idTopAnchor = idLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20)
        let idLeadingAnchor = idLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        let idTrailingAnchor = idLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        let idHeightAnchor = idLabel.heightAnchor.constraint(equalToConstant: 40)
        
        NSLayoutConstraint.activate([idTopAnchor, idLeadingAnchor, idTrailingAnchor, idHeightAnchor])
        
        //title 標籤
        view.addSubview(titleLabel)
        
        let titleTopAnchor = titleLabel.topAnchor.constraint(equalTo: idLabel.bottomAnchor, constant: 20)
        let titleLeadingAnchor = titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        let titleTrailingAnchor = titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        
        NSLayoutConstraint.activate([titleTopAnchor, titleLeadingAnchor, titleTrailingAnchor])
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//MARK:- Clousers
extension DetailViewController {
    
    fileprivate func viewModelClosures() {
        self.imageView.downloadImage(self.photos?.url ?? "")
        self.idLabel.text = "id: \(self.photos?.id ?? 0)"
        self.titleLabel.text = "title: \(self.photos?.title ?? "")"
    }
}
