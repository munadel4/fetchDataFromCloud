//
//  CustomNavigationBarView.swift
//  MobileNOC
//
//  Created by Munadel Qubbaj on 8/12/18.
//  Copyright © 2018 Munadel Qubbaj. All rights reserved.
//

import UIKit

class CustomNavigationBarView: UIView {

    @IBOutlet var view: UIView!
    @IBOutlet var redButton: UIButton!

    private let nibName = "CustomNavigationBarView"

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    func setup() {
        Bundle.main.loadNibNamed(nibName, owner: self, options: nil)
        self.addSubview(view)
        redButton.roundCorners([.topLeft, .bottomLeft], radius: 10, borderColor: nil, borderWidth: nil)
    }

}
