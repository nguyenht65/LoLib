//
//  PassiveCell.swift
//  LoLGuilde
//
//  Created by Bang on 09/11/2021.
//

import UIKit

class PassiveCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var passiveImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setupData(item: Champion) {
        nameLabel.text = item.passive.name
        descriptionTextView.text = item.passive.description.htmlToString
        let urlImage = item.passive.urlImage
        passiveImageView.setImageUrl(with: urlImage)
    }

    func setupUI() {
        passiveImageView.layer.borderWidth = 1
        passiveImageView.layer.borderColor = UIColor.systemYellow.cgColor
        passiveImageView.layer.masksToBounds = true
    }
}
