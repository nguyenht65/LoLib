//
//  SkillsCell.swift
//  LoLGuilde
//
//  Created by Bang on 09/11/2021.
//

import UIKit

class SkillsCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var skillImageView: UIImageView!
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var cooldownLabel: UILabel!
    @IBOutlet weak var rangeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UITextView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setupData(item: Champion, index: Int) {
        nameLabel.text = item.spells[index].name
        costLabel.text = "\(StringConstant.cost)\(item.spells[index].costBurn) \(item.partype)"
        cooldownLabel.text = "\(StringConstant.cooldown)\(item.spells[index].cooldownBurn)\(StringConstant.second)"
        rangeLabel.text = "\(StringConstant.range)\(item.spells[index].rangeBurn)"
        descriptionLabel.text = item.spells[index].description.htmlToString
        let urlImage = item.spells[index].urlImage
        skillImageView.setImageUrl(with: urlImage)
    }

    func setupUI() {
        skillImageView.layer.borderWidth = 1
        skillImageView.layer.borderColor = UIColor.systemYellow.cgColor
        skillImageView.layer.masksToBounds = true
    }
}
