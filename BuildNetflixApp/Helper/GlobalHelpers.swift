import Foundation
import SwiftUI

let exampleVideoURL = URL(string: "https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/360/Big_Buck_Bunny_360_10s_2MB.mp4")!

let exampleImageURL = URL(string: "https://picsum.photos/300/104")!
let exampleImageURL2 = URL(string: "https://picsum.photos/300/105")!
let exampleImageURL3 = URL(string: "https://picsum.photos/300/106")!

var randomExampleImageUrl: URL {
    return [exampleImageURL, exampleImageURL2, exampleImageURL3].randomElement() ?? exampleImageURL
}

let exampleTrailer1 = Trailer(name: "Season 3 Trailer", videoUrl: exampleVideoURL, thumbnailImageUrl: randomExampleImageUrl)
let exampleTrailer2 = Trailer(name: "The Mysterious", videoUrl: exampleVideoURL, thumbnailImageUrl: randomExampleImageUrl)
let exampleTrailer3 = Trailer(name: "Tonikaku Kawaii", videoUrl: exampleVideoURL, thumbnailImageUrl: randomExampleImageUrl)

let exampleTrailers = [exampleTrailer1, exampleTrailer2, exampleTrailer3]

let exampleCategories = ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"]

let exampleMovie1 = Movie(
    id: UUID().uuidString,
    name: "Hello, World",
    thumbnailUrl: URL(string: "https://picsum.photos/200/300")!,
    categories: exampleCategories,
    year: 2020,
    rating: "TV-MA",
    numberOfSeasons: 2,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creators:"©2020竜騎士07／ひぐらしのなく頃に製作委員会",
    cast: "前原圭一:保志総一朗／竜宮レナ:中原麻衣／園崎魅音・詩音:ゆきのさつき／北条沙都子:かないみか／古手梨花:田村ゆかり／大石蔵人:茶風林／富竹ジロウ:大川 透／鷹野三四:伊藤美紀／入江京介:関 俊彦",
    moreLikeThisMovies: moreExampleMovies,
    episodes: [],
    trailers: exampleTrailers)

let exampleMovie2 = Movie(
    id: UUID().uuidString,
    name: "Travelers",
    thumbnailUrl: URL(string: "https://picsum.photos/200/300")!,
    categories: exampleCategories,
    year: 2020,
    rating: "TV-MA",
    numberOfSeasons: 3,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creators:"©2020竜騎士07／ひぐらしのなく頃に製作委員会",
    cast: "前原圭一:保志総一朗／竜宮レナ:中原麻衣／園崎魅音・詩音:ゆきのさつき／北条沙都子:かないみか／古手梨花:田村ゆかり／大石蔵人:茶風林／富竹ジロウ:大川 透／鷹野三四:伊藤美紀／入江京介:関 俊彦",
    moreLikeThisMovies: [],
    promotionHeadline: "New episodes coming soon",
    trailers: exampleTrailers)

let exampleMovie3 = Movie(
    id: UUID().uuidString,
    name: "Community",
    thumbnailUrl: URL(string: "https://picsum.photos/200/300")!,
    categories: exampleCategories,
    year: 2020,
    rating: "TV-MA",
    numberOfSeasons: 3,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creators:"©2020竜騎士07／ひぐらしのなく頃に製作委員会",
    cast: "前原圭一:保志総一朗／竜宮レナ:中原麻衣／園崎魅音・詩音:ゆきのさつき／北条沙都子:かないみか／古手梨花:田村ゆかり／大石蔵人:茶風林／富竹ジロウ:大川 透／鷹野三四:伊藤美紀／入江京介:関 俊彦",
    moreLikeThisMovies: [],
    trailers: exampleTrailers)

let exampleMovie4 = Movie(
    id: UUID().uuidString,
    name: "Python",
    thumbnailUrl: URL(string: "https://picsum.photos/200/300")!,
    categories: exampleCategories,
    year: 2020,
    rating: "TV-MA",
    numberOfSeasons: 3, defaultEpisodeInfo: exampleEpisodeInfo1,
    creators:"©2020竜騎士07／ひぐらしのなく頃に製作委員会",
    cast: "前原圭一:保志総一朗／竜宮レナ:中原麻衣／園崎魅音・詩音:ゆきのさつき／北条沙都子:かないみか／古手梨花:田村ゆかり／大石蔵人:茶風林／富竹ジロウ:大川 透／鷹野三四:伊藤美紀／入江京介:関 俊彦",
    moreLikeThisMovies: [],
    trailers: exampleTrailers)

let exampleMovie5 = Movie(
    id: UUID().uuidString,
    name: "Love Swift",
    thumbnailUrl: URL(string: "https://picsum.photos/200/300")!,
    categories: exampleCategories,
    year: 2020,
    rating: "TV-MA",
    numberOfSeasons: 3, defaultEpisodeInfo: exampleEpisodeInfo1,
    creators:"©2020竜騎士07／ひぐらしのなく頃に製作委員会",
    cast: "前原圭一:保志総一朗／竜宮レナ:中原麻衣／園崎魅音・詩音:ゆきのさつき／北条沙都子:かないみか／古手梨花:田村ゆかり／大石蔵人:茶風林／富竹ジロウ:大川 透／鷹野三四:伊藤美紀／入江京介:関 俊彦",
    moreLikeThisMovies: [],
    trailers: exampleTrailers)

let exampleMovie6 = Movie(
    id: UUID().uuidString,
    name: "Hate Apple",
    thumbnailUrl: URL(string: "https://picsum.photos/200/300")!,
    categories: exampleCategories,
    year: 2020,
    rating: "TV-MA",
    numberOfSeasons: 6,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creators:"©2020竜騎士07／ひぐらしのなく頃に製作委員会",
    cast: "前原圭一:保志総一朗／竜宮レナ:中原麻衣／園崎魅音・詩音:ゆきのさつき／北条沙都子:かないみか／古手梨花:田村ゆかり／大石蔵人:茶風林／富竹ジロウ:大川 透／鷹野三四:伊藤美紀／入江京介:関 俊彦",
    moreLikeThisMovies: [],
    promotionHeadline: "Watch Season 6 Now",
    trailers: exampleTrailers)

var exampleMovies: [Movie] {
    [exampleMovie1, exampleMovie2, exampleMovie3, exampleMovie4, exampleMovie5, exampleMovie6]
}

var moreExampleMovies: [Movie] {
    [exampleMovie2, exampleMovie3, exampleMovie4, exampleMovie5, exampleMovie6]
}
let exampleEpisodeInfo1 = CurrentEpisodeInfo(episodeName: "第1話鬼騙し編　其の壱", description: "昭和五十八年の六月。雛見沢に引っ越してきた圭一は、村に住むレナたちとの新しい生活を楽しんでいた。そんな六月のある日、圭一はダム工事現場の跡地で、偶然出会った写真家の富竹から不穏な話を聞かされる。"
                                             , season: 1, episode: 1)


extension LinearGradient {
    static let blackOpacityGradient = LinearGradient(
        gradient: Gradient(
            colors: [Color.clear,
                     Color.black.opacity(0.95)]),
        startPoint: .top,
        endPoint: .bottom
    )
}

extension String {
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
}
