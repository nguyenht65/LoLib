//
//  TipsViewController.swift
//  LoLib
//
//  Created by Bang on 01/12/2021.
//

import UIKit

class TipsViewController: BaseViewController {

    @IBOutlet weak var tipsTextView: UITextView!
    private var champion: Champion!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func setupUI() {
        title = "Champion Tips"
    }

    override func setupData() {
        let allyTips = "Ally tips: \n"
        let enemyTips = "\nEnemy tips: \n"

        if !champion.allytips.isEmpty {
            tipsTextView.text.append(contentsOf: allyTips)
            for tip in champion.allytips {
                tipsTextView.text.append(contentsOf: "  - \(tip)\n")
            }
        }

        if !champion.enemytips.isEmpty {
            tipsTextView.text.append(contentsOf: enemyTips)
            for tip in champion.enemytips {
                tipsTextView.text.append(contentsOf: "  - \(tip)\n")
            }
        }
    }

    func getChampion(champion: Champion) {
        self.champion = champion
    }

}

