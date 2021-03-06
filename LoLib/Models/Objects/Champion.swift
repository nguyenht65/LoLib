//
//  Champion.swift
//  LoLGuilde
//
//  Created by Bang on 27/10/2021.

import Foundation

// MARK: - ChampionBase
struct BaseChampion: Codable {
    let data: [String: Champion]
}

// MARK: - Champion
struct Champion: Codable {
    let id, name, title: String
    let image: Image
    let skins: [Skin]
    let lore, blurb: String
    let allytips, enemytips: [String]
    let tags: [Tag]
    let partype: String
    let info: Info
    let stats: Stats
    let spells: [Spell]
    let passive: Passive

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case title = "title"
        case image = "image"
        case skins = "skins"
        case lore = "lore"
        case blurb = "blurb"
        case allytips = "allytips"
        case enemytips = "enemytips"
        case tags = "tags"
        case partype = "partype"
        case info = "info"
        case stats = "stats"
        case spells = "spells"
        case passive = "passive"
    }
}

enum Tag: String, Codable {
    case assassin = "Assassin"
    case fighter = "Fighter"
    case mage = "Mage"
    case marksman = "Marksman"
    case support = "Support"
    case tank = "Tank"
}

extension Champion {
    var urlImage: String {
        return Image.EndPoint.champion.urlString + image.full
    }

    var placeholderImage: String {
        return Image.LoadingImage.square.rawValue
    }
}

extension Champion {
    func getStatus(championStatusValue: ChampionStatusValue) -> String {
        switch championStatusValue {
        case .health:
            return "\(stats.hp)(\(stats.hpperlevel))"
        case .healthRegen:
            return "\(stats.hpregen)(\(stats.hpregenperlevel))"
        case .mana:
            return "\(stats.mp)(\(stats.mpperlevel))"
        case .manaRegen:
            return "\(stats.mpregen)(\(stats.mpregenperlevel))"
        case .attackDamage:
            return "\(stats.attackdamage)(\(stats.attackdamageperlevel))"
        case .attackSpeed:
            return "\(stats.attackspeed)(\(stats.attackspeedperlevel))"
        case .armor:
            return "\(stats.armor)(\(stats.armorperlevel))"
        case .spellBlock:
            return "\(stats.spellblock)(\(stats.spellblockperlevel))"
        case .attackRange:
            return "\(stats.attackrange)"
        case .moveSpeed:
            return "\(stats.movespeed)"
        }
    }
}
