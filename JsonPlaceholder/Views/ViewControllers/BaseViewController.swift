//
//  BaseViewController.swift
//  JsonPlaceholder
//
//  Created by apple on 2020/6/11.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    var viewModel = PhotosViewModel()
    var numberOfColumns: CGFloat = PhotosConstants.defaultColumnCount
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpViewController()
    }
    
    private func setUpViewController() {
        view.backgroundColor = .white
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
