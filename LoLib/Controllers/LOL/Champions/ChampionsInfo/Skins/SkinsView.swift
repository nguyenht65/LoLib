//
//  SkinsView.swift
//  LoLGuilde
//
//  Created by Bang on 10/11/2021.
//

import UIKit

class SkinsView: BaseView {

    @IBOutlet weak var skinsTableView: UITableView!

    private var champion: Champion!

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func commonInit() {
        super.commonInit()
        let nib = UINib(nibName: SkinsCell.className, bundle: .main)
        skinsTableView.register(nib, forCellReuseIdentifier: SkinsCell.className)
        skinsTableView.delegate = self
        skinsTableView.dataSource = self
    }

    func getChampion(champion: Champion) {
        self.champion = champion
    }
}

extension SkinsView: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return champion.skins.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(SkinsCell.self)
        cell.setupData(item: champion, index: indexPath.row)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230
    }

}
