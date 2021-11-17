//
//  PrecisionView.swift
//  LoLGuilde
//
//  Created by Bang on 10/11/2021.
//

import UIKit

class PrecisionView: BaseView {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var slot1_r1View: EachRuneView!
    @IBOutlet weak var slot1_r2View: EachRuneView!
    @IBOutlet weak var slot1_r3View: EachRuneView!
    @IBOutlet weak var slot1_r4View: EachRuneView!
    @IBOutlet weak var slot2_r1View: EachRuneView!
    @IBOutlet weak var slot2_r2View: EachRuneView!
    @IBOutlet weak var slot2_r3View: EachRuneView!
    @IBOutlet weak var slot3_r1View: EachRuneView!
    @IBOutlet weak var slot3_r2View: EachRuneView!
    @IBOutlet weak var slot3_r3View: EachRuneView!
    @IBOutlet weak var slot4_r1View: EachRuneView!
    @IBOutlet weak var slot4_r2View: EachRuneView!
    @IBOutlet weak var slot4_r3View: EachRuneView!

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func setupUI(item: Rune) {
//        nameLabel.text = item.name
        slot1_r1View.setupUI(item: item, slotsIndex: 0, runeIndex: 0)
        slot1_r2View.setupUI(item: item, slotsIndex: 0, runeIndex: 1)
        slot1_r3View.setupUI(item: item, slotsIndex: 0, runeIndex: 2)
        slot1_r4View.setupUI(item: item, slotsIndex: 0, runeIndex: 3)
        slot2_r1View.setupUI(item: item, slotsIndex: 1, runeIndex: 0)
        slot2_r2View.setupUI(item: item, slotsIndex: 1, runeIndex: 1)
        slot2_r3View.setupUI(item: item, slotsIndex: 1, runeIndex: 2)
        slot3_r1View.setupUI(item: item, slotsIndex: 2, runeIndex: 0)
        slot3_r2View.setupUI(item: item, slotsIndex: 2, runeIndex: 1)
        slot3_r3View.setupUI(item: item, slotsIndex: 2, runeIndex: 2)
        slot4_r1View.setupUI(item: item, slotsIndex: 3, runeIndex: 0)
        slot4_r2View.setupUI(item: item, slotsIndex: 3, runeIndex: 1)
        slot4_r3View.setupUI(item: item, slotsIndex: 3, runeIndex: 2)
    }
}
