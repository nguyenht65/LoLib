//
//  ItemsCell.swift
//  LoLGuilde
//
//  Created by Bang on 01/11/2021.
//

import UIKit

class ItemsCell: UICollectionViewCell {

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var imageViewHeightConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    func setupData(item: Item) {
        itemImageView.setImageUrl(with: item.urlImage)
        itemNameLabel.text = item.name
        if item.into?.isEmpty != nil && item.from?.isEmpty != nil {
            itemImageView.layer.borderColor = UIColor.systemYellow.cgColor
        } else if item.into?.isEmpty != nil {
            itemImageView.layer.borderColor = UIColor.systemGray.cgColor
        } else if item.from?.isEmpty != nil {
            itemImageView.layer.borderColor = UIColor.systemPink.cgColor
        } else {
            itemImageView.layer.borderColor = UIColor.systemMint.cgColor
        }
    }

    func setupUI() {
        itemImageView.layoutIfNeeded()
        itemImageView.layer.borderWidth = 1
        itemImageView.layer.masksToBounds = true
        setDeviceConstraint()
    }

    private func setDeviceConstraint() {
        if DeviceHelper().isSmallDevice() {
            imageViewHeightConstraint.constant = 30
            itemNameLabel.font = .systemFont(ofSize: 11)
        }
    }
}
