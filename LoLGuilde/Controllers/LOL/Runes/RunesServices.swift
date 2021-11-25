//
//  RunesServices.swift
//  LoLGuilde
//
//  Created by Bang on 24/11/2021.
//

import RxSwift

struct RunesServices {

    private static var sharedRunesServices: RunesServices = {
        let runesServices = RunesServices()
        return runesServices
    }()

    static func shared() -> RunesServices {
        return sharedRunesServices
    }

    func getRunes() -> Observable<[Rune]> {
        let url = Networking.EndPoint.rune.url
        let request: Observable<BaseRune> = Networking.shared().request(url: url)
        return request
            .map { elements in
                var listRunes: [Rune] = []
                for rune in elements {
                    listRunes.append(rune)
                }
                return listRunes
            }
            .catchAndReturn([])
            .share(replay: 1, scope: .forever)
    }
}
