import Foundation

struct Debit: Codable {
    let _id: String
    let name: String
    let description: String
    let color: String
    let debits: [Detail]
}

struct Detail: Codable {
    let _id: String
    let name: String
    let color: String
    let value: Double
    let parcel: Parcel
    let tag: Tag
}

struct Parcel: Codable {
    let initial: Int
    let final: Int
}

struct Tag: Codable {
    let name: String
    let color: String
}
