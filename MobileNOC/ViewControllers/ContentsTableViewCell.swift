//
//  ContentsTableViewCell.swift
//  MobileNOC
//
//  Created by Munadel Qubbaj on 8/11/18.
//  Copyright © 2018 Munadel Qubbaj. All rights reserved.
//

import UIKit

enum StatusColor: Int {
    case green = 1
    case orange = 2
    case yellow = 3
    case red = 4
}

class ContentsTableViewCell: UITableViewCell {

    @IBOutlet var serverImage: UIImageView!
    @IBOutlet var serverLocation: UILabel!
    @IBOutlet var serverName: UILabel!
    @IBOutlet var serverIpAddress: UILabel!
    @IBOutlet var serverIpSubnet: UILabel!
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var serverType: UILabel!
    @IBOutlet var blackDot: UIButton!
    @IBOutlet var checkButton: UIButton!
    @IBOutlet var callButton: UIButton!
    @IBOutlet var watchButton: UIButton!
    @IBOutlet var muteButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configureCell(contentData: Content) {
        serverIpAddress.text = contentData.ipAddress
        serverIpSubnet.text = contentData.ipSubnetMask
        serverName.text = contentData.name
        statusLabel.text = contentData.status?.statusValue
        serverType.text = contentData.type?.name

        configureStatusColor(status: (contentData.status?.id)!)
    }

    private func configureStatusColor(status: Int) {

        switch status {
        case StatusColor.green.rawValue:
            blackDot.backgroundColor = .green
        case StatusColor.orange.rawValue:
            blackDot.backgroundColor = .orange
        case StatusColor.yellow.rawValue:
            blackDot.backgroundColor = .yellow
        case StatusColor.red.rawValue:
            blackDot.backgroundColor = .red
        default:
            blackDot.backgroundColor = .red
        }

    }

    override func layoutSubviews() {
        super.layoutSubviews()

        blackDot.roundCorners(.allCorners, radius: blackDot.frame.size.width/2, borderColor: nil, borderWidth: nil)
        serverImage.roundCorners(.allCorners, radius: serverImage.frame.size.width/2, borderColor: nil, borderWidth: nil)
        checkButton.roundCorners(.allCorners, radius: checkButton.frame.size.width/2, borderColor: nil, borderWidth: nil)
        callButton.roundCorners(.allCorners, radius: callButton.frame.size.width/2, borderColor: nil, borderWidth: nil)
        watchButton.roundCorners(.allCorners, radius: watchButton.frame.size.width/2, borderColor: nil, borderWidth: nil)
        muteButton.roundCorners(.allCorners, radius: muteButton.frame.size.width/2, borderColor: nil, borderWidth: nil)

    }
    class func identifier() -> String {
        return String(describing: self)
    }

    class func nib() -> UINib {
        return UINib(nibName: identifier(), bundle: nil)
    }
    
}
