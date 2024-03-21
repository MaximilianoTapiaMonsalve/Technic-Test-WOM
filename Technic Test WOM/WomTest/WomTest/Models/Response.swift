//
//  SongDetailView.swift
//  WomTest
//
//  Created by Max Tapia on 19-03-24.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:


import Foundation

// MARK: - Response
struct Response: Codable {
    let feed: Feed
}

// MARK: - Feed
struct Feed: Codable {
    let author: Author
    let entry: [Entry]
    let updated, rights, title, icon: Icon
    let link: [IMCollectionLink]
    let id: Icon
}

// MARK: - Author
struct Author: Codable {
    let name, uri: Icon
}

// MARK: - Icon
struct Icon: Codable {
    let label: String
}

// MARK: - Entry
struct Entry: Codable {
    let imName: Icon
    let imImage: [IMImage]
    let imCollection: IMCollection
    let imPrice: IMPrice
    let imContentType: IMCollectionImContentType
    let rights, title: Icon
    let link: [EntryLink]
    let id: ID
    let imArtist: IMArtist
    let category: Category
    let imReleaseDate: IMReleaseDate?

    enum CodingKeys: String, CodingKey {
        case imName = "im:name"
        case imImage = "im:image"
        case imCollection = "im:collection"
        case imPrice = "im:price"
        case imContentType = "im:contentType"
        case rights, title, link, id
        case imArtist = "im:artist"
        case category
        case imReleaseDate = "im:releaseDate"
    }
}

// MARK: - Category
struct Category: Codable {
    let attributes: CategoryAttributes
}

// MARK: - CategoryAttributes
struct CategoryAttributes: Codable {
    let imId, term: String
    let scheme: String
    let label: String

    enum CodingKeys: String, CodingKey {
        case imId = "im:id"
        case term, scheme, label
    }
}

// MARK: - ID
struct ID: Codable {
    let label: String
    let attributes: IDAttributes
}

// MARK: - IDAttributes
struct IDAttributes: Codable {
    let imId: String

    enum CodingKeys: String, CodingKey {
        case imId = "im:id"
    }
}

// MARK: - IMArtist
struct IMArtist: Codable {
    let label: String
    let attributes: IMArtistAttributes
}

// MARK: - IMArtistAttributes
struct IMArtistAttributes: Codable {
    let href: String
}

// MARK: - IMCollection
struct IMCollection: Codable {
    let imName: Icon
    let link: IMCollectionLink
    let imContentType: IMCollectionImContentType

    enum CodingKeys: String, CodingKey {
        case imName = "im:name"
        case link
        case imContentType = "im:contentType"
    }
}

// MARK: - IMCollectionImContentType
struct IMCollectionImContentType: Codable {
    let imContentType: IMContentTypeImContentType
    let attributes: IMContentTypeAttributes

    enum CodingKeys: String, CodingKey {
        case imContentType = "im:contentType"
        case attributes
    }
}

// MARK: - IMContentTypeAttributes
struct IMContentTypeAttributes: Codable {
    let term, label: String
}

// MARK: - IMContentTypeImContentType
struct IMContentTypeImContentType: Codable {
    let attributes: IMContentTypeAttributes
}

// MARK: - IMCollectionLink
struct IMCollectionLink: Codable {
    let attributes: PurpleAttributes
}

// MARK: - PurpleAttributes
struct PurpleAttributes: Codable {
    let rel: String
    let type: String?
    let href: String
}

// MARK: - IMImage
struct IMImage: Codable {
    let label: String
    let attributes: IMImageAttributes
}

// MARK: - IMImageAttributes
struct IMImageAttributes: Codable {
    let height: String
}

// MARK: - IMPrice
struct IMPrice: Codable {
    let label: String
    let attributes: IMPriceAttributes
}

// MARK: - IMPriceAttributes
struct IMPriceAttributes: Codable {
    let amount, currency: String
}

// MARK: - IMReleaseDate
struct IMReleaseDate: Codable {
    let label: String
    let attributes: Icon
}

// MARK: - EntryLink
struct EntryLink: Codable {
    let attributes: FluffyAttributes
    let imDuration: Icon?

    enum CodingKeys: String, CodingKey {
        case attributes
        case imDuration = "im:duration"
    }
}

// MARK: - FluffyAttributes
struct FluffyAttributes: Codable {
    let rel, type: String
    let href: String
    let title, imAssetType: String?

    enum CodingKeys: String, CodingKey {
        case rel, type, href, title
        case imAssetType = "im:assetType"
    }
}
