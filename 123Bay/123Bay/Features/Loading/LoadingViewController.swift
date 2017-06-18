//
//  LoadingViewController.swift
//  123bay
//
//  Created by Huỳnh Công Thái on 5/25/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit
import SnapKit
import AMScrollingNavbar

/*
    This class is a introduce of application
    This class wait for loading data
    This class will present to HomeViewController when finished for load data
*/
class LoadingViewController: BaseViewController {
    
    // MARK: Define controls
    let logoImageView: UIImageView = {
        let imageView: UIImageView = UIImageView(frame: CGRect.zero)
        
        imageView.image = #imageLiteral(resourceName: "1-1")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let loadingView: LoadingView = {
        let view: LoadingView = LoadingView()
        
        return view
    }()
    
    // MARK: Setup layout
    func setupLogoImageView() {
        self.view.addSubview(logoImageView)
        logoImageView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(3.0 / 5.0)
            make.height.equalTo(self.logoImageView.snp.width)
        }
    }
    
    func setupLoadingView() {
        self.view.addSubview(loadingView)
        loadingView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-16)
            make.width.equalToSuperview().dividedBy(4)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.loadingView.startAnimation()
    }
    
    override func setup() {
        self.view.backgroundColor = Theme.mainColor
        self.setupLogoImageView()
        self.setupLoadingView()
        
        // should delete when have been data from API
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { (time) in
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .vertical
            
            let scrollingNavigationController = ScrollingNavigationController(rootViewController: HomeViewController(collectionViewLayout: layout))

            self.present(scrollingNavigationController, animated: true, completion: nil)
        }
        
    }
}
