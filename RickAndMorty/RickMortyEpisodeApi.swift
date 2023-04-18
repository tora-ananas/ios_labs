//
//  RickMortyEpisode.swift
//  MarvelLab
//
//  Created by Effective on 26.03.2023.
//

import Foundation

// MARK: - RickMortyEpisode
struct RickMortyEpisodeApi: Codable {
    let id: Int
    let name, airDate, episode: String
    let characters: [String]
    let url: String
    let created: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case airDate = "air_date"
        case episode, characters, url, created
    }
}
