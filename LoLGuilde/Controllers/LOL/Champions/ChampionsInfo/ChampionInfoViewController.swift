//
//  ChampionInfoViewController.swift
//  LoLGuilde
//
//  Created by Bang on 01/11/2021.
//

import UIKit

class ChampionInfoViewController: BaseViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tag1Label: UILabel!
    @IBOutlet weak var tag2Label: UILabel!
    @IBOutlet weak var championImageView: UIImageView!
    @IBOutlet weak var infoStackView: UIStackView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!

    private var champion: Champion!
    private var urlImage: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
//        let generalView = GeneralView()
//        generalView.translatesAutoresizingMaskIntoConstraints = false
        let generalView = GeneralView(frame: infoStackView.bounds)
        generalView.setupData(item: champion)
        infoStackView.addArrangedSubview(generalView)
    }

    func getDataFromController(champion: Champion, urlStringImage: String) {
        self.champion = champion
        self.urlImage = urlStringImage
    }

    override func setupUI() {
        title = "Champion Info"
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "textColor")]
        segmentedControl.setTitleTextAttributes(titleTextAttributes as [NSAttributedString.Key : Any], for: .normal)
        segmentedControl.setTitleTextAttributes(titleTextAttributes as [NSAttributedString.Key : Any], for: .selected)
    }

    override func setupData() {
        nameLabel.text = champion.name
        titleLabel.text = champion.title
        tag1Label.text = champion.tags[0].rawValue
        if champion.tags.count > 1 {
            tag2Label.text = champion.tags[1].rawValue
        } else {
            tag2Label.text = ""
        }
        championImageView.sd_setImage(with: URL(string: urlImage), placeholderImage: UIImage(named: "loading_2"))
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    @IBAction func changeSegmentedControl(_ sender: UISegmentedControl) {
        for i in infoStackView.arrangedSubviews {
            i.removeFromSuperview()
        }
        var view = UIView()
        switch sender.selectedSegmentIndex {
        case 0:
            view = GeneralView(frame: infoStackView.bounds)
            (view as? GeneralView)?.setupData(item: champion)
        case 1:
            view = SkillsView(frame: infoStackView.bounds)
            (view as? SkillsView)?.getChampion(champion: champion)
        case 2:
            view = LoreView(frame: infoStackView.bounds)
            (view as? LoreView)?.setupData(item: champion)
        case 3:
            view = SkinsView(frame: infoStackView.bounds)
            (view as? SkinsView)?.getChampion(champion: champion)
        default:
            return
        }
        infoStackView.addArrangedSubview(view)
    }
}
