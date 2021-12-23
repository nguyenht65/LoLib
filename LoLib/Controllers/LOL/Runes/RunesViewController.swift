//
//  RunesViewController.swift
//  LoLGuilde
//
//  Created by Bang on 27/10/2021.
//

import UIKit
import RxSwift
import RxRelay

class RunesViewController: BaseViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var runesStackView: UIStackView!

    private let disposeBag = DisposeBag()
    private var viewModel: RunesViewModel

    private lazy var precisionView: RuneTypeView = {
        let rune = viewModel.runes.value[2]
        let view = RuneTypeView(frame: runesStackView.bounds, rune: rune)
        view.backgroundImageView.image = UIImage(named: Image.RuneBackground.precision.rawValue)
        return view
    }()
    private lazy var dominationView: RuneTypeView = {
        let rune = viewModel.runes.value[0]
        let view = RuneTypeView(frame: runesStackView.bounds, rune: rune)
        view.backgroundImageView.image = UIImage(named: Image.RuneBackground.domination.rawValue)
        return view
    }()
    private lazy var sorceryView: RuneTypeView = {
        let rune = viewModel.runes.value[4]
        let view = RuneTypeView(frame: runesStackView.bounds, rune: rune)
        view.backgroundImageView.image = UIImage(named: Image.RuneBackground.sorcery.rawValue)
        return view
    }()
    private lazy var resolveView: RuneTypeView = {
        let rune = viewModel.runes.value[3]
        let view = RuneTypeView(frame: runesStackView.bounds, rune: rune)
        view.backgroundImageView.image = UIImage(named: Image.RuneBackground.resolve.rawValue)
        return view
    }()
    private lazy var inspirationView: RuneTypeView = {
        let rune = viewModel.runes.value[1]
        let view = RuneTypeView(frame: runesStackView.bounds, rune: rune)
        view.backgroundImageView.image = UIImage(named: Image.RuneBackground.inspiration.rawValue)
        return view
    }()

    init(runesServices: RunesServicesProtocol) {
        self.viewModel = RunesViewModel(service: runesServices)
        super.init(nibName: RunesViewController.className, bundle: .main)
    }

    required init?(coder: NSCoder) {
        fatalError("Error at RunesViewController")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func setupUI() {
        segmentedControl.selectedSegmentTintColor = UIColor.systemYellow
    }

    override func setupData() {
        viewModel.loadData()
        bindViewModel()
    }

    func bindViewModel() {
        viewModel.runes
            .asObservable()
            .subscribe(onNext: { [weak self] element in
                guard let self = self else { return }
                if !element.isEmpty {
                let view = self.precisionView
                self.runesStackView.addArrangedSubview(view)
                }
            })
            .disposed(by: disposeBag)
    }

    @IBAction func selectedSegmentedControl(_ sender: UISegmentedControl) {
        for view in runesStackView.arrangedSubviews {
            view.removeFromSuperview()
        }
        var view = UIView()
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            segmentedControl.selectedSegmentTintColor = UIColor.systemYellow
            view = precisionView
        case 1:
            segmentedControl.selectedSegmentTintColor = UIColor.systemRed
            view = dominationView
        case 2:
            segmentedControl.selectedSegmentTintColor = UIColor.systemCyan
            view = sorceryView
        case 3:
            segmentedControl.selectedSegmentTintColor = UIColor.systemGreen
            view = resolveView
        case 4:
            segmentedControl.selectedSegmentTintColor = UIColor.systemMint
            view = inspirationView
        default:
            return
        }
        (view as? RuneTypeView)?.closeDetailView()
        runesStackView.addArrangedSubview(view)
    }
}
