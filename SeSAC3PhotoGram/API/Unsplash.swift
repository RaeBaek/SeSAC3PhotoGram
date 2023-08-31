//
//  Unsplash.swift
//  SeSAC3PhotoGram
//
//  Created by 백래훈 on 2023/08/31.
//
import Foundation

// MARK: - Welcome
struct Unsplash: Codable {
    let total, totalPages: Int
    let results: [Result]

    enum CodingKeys: String, CodingKey {
        case total
        case totalPages = "total_pages"
        case results
    }
}

// MARK: - Result
struct Result: Codable {
    let id, slug: String
    let createdAt, updatedAt: String?
    let promotedAt: String?
    let width, height: Int
    let color, blurHash: String
    let description: String?
    let altDescription: String
    let urls: Urls
    let links: ResultLinks
    let likes: Int
    let likedByUser: Bool
    let sponsorship: Sponsorship?
    let user: User
    let tags: [Tag]?

    enum CodingKeys: String, CodingKey {
        case id, slug
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case promotedAt = "promoted_at"
        case width, height, color
        case blurHash = "blur_hash"
        case description
        case altDescription = "alt_description"
        case urls, links, likes
        case likedByUser = "liked_by_user"
        case sponsorship
        case user, tags
    }
}

// MARK: - ResultLinks
struct ResultLinks: Codable {
    let linksSelf, html, download, downloadLocation: String

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case html, download
        case downloadLocation = "download_location"
    }
}

// MARK: - Sponsorship
struct Sponsorship: Codable {
    let tagline: String
    let taglineURL: String
    let sponsor: User

    enum CodingKeys: String, CodingKey {
        case tagline
        case taglineURL = "tagline_url"
        case sponsor
    }
}

// MARK: - User
struct User: Codable {
    let id: String
    let updatedAt: String?
    let username, name, firstName: String
    let lastName, twitterUsername: String?
    let portfolioURL: String?
    let bio, location: String?
    let links: UserLinks
    let profileImage: ProfileImage
    let instagramUsername: String?
    let totalCollections, totalLikes, totalPhotos: Int
    let acceptedTos, forHire: Bool
    let social: Social

    enum CodingKeys: String, CodingKey {
        case id
        case updatedAt = "updated_at"
        case username, name
        case firstName = "first_name"
        case lastName = "last_name"
        case twitterUsername = "twitter_username"
        case portfolioURL = "portfolio_url"
        case bio, location, links
        case profileImage = "profile_image"
        case instagramUsername = "instagram_username"
        case totalCollections = "total_collections"
        case totalLikes = "total_likes"
        case totalPhotos = "total_photos"
        case acceptedTos = "accepted_tos"
        case forHire = "for_hire"
        case social
    }
}

// MARK: - UserLinks
struct UserLinks: Codable {
    let linksSelf, html, photos, likes: String
    let portfolio, following, followers: String

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case html, photos, likes, portfolio, following, followers
    }
}

// MARK: - ProfileImage
struct ProfileImage: Codable {
    let small, medium, large: String
}

// MARK: - Social
struct Social: Codable {
    let instagramUsername: String?
    let portfolioURL: String?
    let twitterUsername: String?

    enum CodingKeys: String, CodingKey {
        case instagramUsername = "instagram_username"
        case portfolioURL = "portfolio_url"
        case twitterUsername = "twitter_username"
    }
}

// MARK: - Tag
struct Tag: Codable {
    let type: TypeEnum
    let title: String
    let source: Source?
}

// MARK: - Source
struct Source: Codable {
    let ancestry: Ancestry
    let title, subtitle, description, metaTitle: String
    let metaDescription: String
    let coverPhoto: CoverPhoto?

    enum CodingKeys: String, CodingKey {
        case ancestry, title, subtitle, description
        case metaTitle = "meta_title"
        case metaDescription = "meta_description"
        case coverPhoto = "cover_photo"
    }
}

// MARK: - Ancestry
struct Ancestry: Codable {
    let type, category: Category
    let subcategory: Category?
}

// MARK: - Category
struct Category: Codable {
    let slug, prettySlug: String

    enum CodingKeys: String, CodingKey {
        case slug
        case prettySlug = "pretty_slug"
    }
}

// MARK: - CoverPhoto
struct CoverPhoto: Codable {
    let id, slug: String
    let createdAt, updatedAt: String?
    let promotedAt: String?
    let width, height: Int
    let color, blurHash, description, altDescription: String?
    let urls: Urls
    let links: ResultLinks
    let likes: Int
    let likedByUser: Bool
    let premium, plus: Bool
    let user: User?

    enum CodingKeys: String, CodingKey {
        case id, slug
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case promotedAt = "promoted_at"
        case width, height, color
        case blurHash = "blur_hash"
        case description
        case altDescription = "alt_description"
        case urls, links, likes
        case likedByUser = "liked_by_user"
        case premium, plus, user
    }
}

enum Status: String, Codable {
    case approved = "approved"
    case rejected = "rejected"
}

// MARK: - Urls
struct Urls: Codable {
    let raw, full, regular, small: String
    let thumb, smallS3: String

    enum CodingKeys: String, CodingKey {
        case raw, full, regular, small, thumb
        case smallS3 = "small_s3"
    }
}

enum TypeEnum: String, Codable {
    case landingPage = "landing_page"
    case search = "search"
}

