import Foundation
import SwiftUI

let exampleCategories = ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"]

let exampleMovie1 = Movie(id: UUID().uuidString,
                          name: "Hello, World",
                          thumbnailUrl: URL(string: "https://picsum.photos/200/300")!, categories: exampleCategories)

let exampleMovie2 = Movie(id: UUID().uuidString,
                          name: "Travelers",
                          thumbnailUrl: URL(string: "https://picsum.photos/200/300")!, categories: exampleCategories)

let exampleMovie3 = Movie(id: UUID().uuidString,
                          name: "Community",
                          thumbnailUrl: URL(string: "https://picsum.photos/200/300")!, categories: exampleCategories)

let exampleMovie4 = Movie(id: UUID().uuidString,
                          name: "Python",
                          thumbnailUrl: URL(string: "https://picsum.photos/200/300")!, categories: exampleCategories)

let exampleMovie5 = Movie(id: UUID().uuidString,
                          name: "Love Swift",
                          thumbnailUrl: URL(string: "https://picsum.photos/200/300")!, categories: exampleCategories)

let exampleMovie6 = Movie(id: UUID().uuidString,
                          name: "Hate Apple",
                          thumbnailUrl: URL(string: "https://picsum.photos/200/300")!, categories: exampleCategories)

let exampleMovies: [Movie] = [exampleMovie1, exampleMovie2, exampleMovie3, exampleMovie4, exampleMovie5, exampleMovie6]


extension LinearGradient {
    static let blackOpacityGradient = LinearGradient(
        gradient: Gradient(
            colors: [Color.clear,
                     Color.black.opacity(0.95)]),
        startPoint: .top,
        endPoint: .bottom
    )
}
