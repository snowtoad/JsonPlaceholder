//
//  ViewController.swift
//  JsonPlaceholder
//
//  Created by apple on 2020/6/11.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class JsonPlaceholderViewController: BaseViewController {

    lazy var jsonPlaceHolderLabel: UILabel = {
        let label = UILabel()
        label.text = "JSON Placeholder"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var requestAPIButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Request API", for: .normal)
        button.addTarget(self, action: #selector(self.requestAPIButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setUpLayout()
    }
    
    private func setUpLayout() {
        //JSON PlaceHolder 標籤
        view.addSubview(jsonPlaceHolderLabel)
        
        let jpTopAnchor = jsonPlaceHolderLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60)
        let jpCenterXAnchor = jsonPlaceHolderLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        
        NSLayoutConstraint.activate([jpTopAnchor, jpCenterXAnchor])
        
        //API Request 按鈕
        view.addSubview(requestAPIButton)
        
        let apiRequestCenterXAnchor = requestAPIButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let apiRequestCenterYAnchor = requestAPIButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        
        NSLayoutConstraint.activate([apiRequestCenterXAnchor, apiRequestCenterYAnchor])
    }
    
    @objc private func requestAPIButtonTapped() {
        let vc = ResultViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

