//
//  Joke.swift
//  ChuckApp
//
//  Created by Ivo Dutra on 09/08/20.
//  Copyright © 2020 Ivo Dutra. All rights reserved.
//

import Foundation

/// Struct based on the ChuckNorrisAPI
struct Joke: Codable {
    // TODO: categories array
    var createDate: String
    var iconURL: URL
    var updateDate: String
    // URL to this specific joke, once it was retrived randomly
    var url: URL
    var jokeText: String

    enum CodingKeys: String, CodingKey {
        case createDate = "created_at"
        case iconURL = "icon_url"
        case updateDate = "updated_at"
        case url
        case jokeText = "value"
    }

    // Init is called so that we can ignore the extraneous key/value pairs in the data that Struct Joke will not include
    // Keys "categories" and "id" are not used.
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)

        self.createDate = try valueContainer.decode(String.self, forKey: CodingKeys.createDate)
        self.iconURL = try valueContainer.decode(URL.self, forKey: CodingKeys.iconURL)
        self.updateDate = try valueContainer.decode(String.self, forKey: CodingKeys.updateDate)
        self.url = try valueContainer.decode(URL.self, forKey: CodingKeys.url)
        self.jokeText = try valueContainer.decode(String.self, forKey: CodingKeys.jokeText)
    }
}
