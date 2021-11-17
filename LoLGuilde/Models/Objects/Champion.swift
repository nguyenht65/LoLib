//
//  Champion.swift
//  LoLGuilde
//
//  Created by Bang on 27/10/2021.

import Foundation

// MARK: - ChampionBase
struct ChampionBase: Codable {
    let data: [String: Champion]
}

// MARK: - Champion
struct Champion: Codable {
    let id, name, title: String
    let image: Image
    let skins: [Skins]
    let lore, blurb: String
    let allytips, enemytips: [String]
    let tags: [Tag]
    let partype: String
    let info: Info
    let stats: Stats
    let spells: [Spells]
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
