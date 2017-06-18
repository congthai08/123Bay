//
//  LoadingView.swift
//  123bay
//
//  Created by Huỳnh Công Thái on 5/25/17.
//  Copyright © 2017 123bay. All rights reserved.
//

import UIKit
import SnapKit

class LoadingView: BaseUIView {
    
    private var timer: Timer!
    private var alphas: [CGFloat] = [
        Theme.lagreAlpha,
        Theme.mediumAlpha,
        Theme.smallAlpha
    ]
    
    private let largeImageView: UIImageView = {
        let imageView: UIImageView = UIImageView(frame: .zero)
        
        imageView.image = #imageLiteral(resourceName: "Large")
        imageView.alpha = Theme.lagreAlpha
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let mediumImageView: UIImageView = {
        let imageView: UIImageView = UIImageView(frame: .zero)
        
        imageView.image = #imageLiteral(resourceName: "Medium")
        imageView.alpha = Theme.mediumAlpha
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let smallImageView: UIImageView = {
        let imageView: UIImageView = UIImageView(frame: .zero)
        
        imageView.image = #imageLiteral(resourceName: "Small")
        imageView.alpha = Theme.smallAlpha
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private func setupLargeImageView() {
        self.addSubview(largeImageView)
        self.largeImageView.snp.makeConstraints { (make) in
            make.top.left.bottom.equalToSuperview()
            make.width.equalToSuperview().dividedBy(3)
            make.height.equalTo(self.largeImageView.snp.width)
        }
    }
    
    private func setupMediumImageView() {
        self.addSubview(mediumImageView)
        mediumImageView.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.largeImageView)
            make.height.equalTo(self.largeImageView).multipliedBy(3.0/4.0)
            make.left.equalTo(self.largeImageView.snp.right)
            make.width.equalTo(self.mediumImageView)
        }
    }
    
    private func setupSmallImageView() {
        self.addSubview(smallImageView)
        smallImageView.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.mediumImageView)
            make.height.equalTo(self.mediumImageView).multipliedBy(8.0/9.0)
            make.left.equalTo(self.mediumImageView.snp.right)
            make.width.equalTo(self.mediumImageView.snp.height)
            make.right.equalToSuperview()
        }
    }
    
    override func setupView() {
        self.setupLargeImageView()
        self.setupMediumImageView()
        self.setupSmallImageView()
    }
    
    func startAnimation() {
        
        if timer != nil {
            return
        }
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.6, repeats: true, block: { [weak self] (time) in
            
            guard let selfine = self else {
                return
            }
            
            selfine.move()
            UIView.animate(withDuration: 0.6, delay: 0, options: [.curveLinear], animations: {
                selfine.largeImageView.alpha = selfine.alphas[0]
                selfine.mediumImageView.alpha = selfine.alphas[1]
                selfine.smallImageView.alpha = selfine.alphas[2]
            }, completion: nil)
        })
    }
    
    private func move() {
       alphas.insert(alphas.removeLast(), at: 0)
    }
    
    private func stopAnimation() {
        
        if timer == nil {
            return
        }
        
        timer.invalidate()
        timer = nil
    }
}
