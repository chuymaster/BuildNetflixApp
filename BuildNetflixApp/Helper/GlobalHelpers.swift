import Foundation
import SwiftUI

let exampleVideoURL = URL(string: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")!

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
    accentColor: .blue,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creators:"©2020竜騎士07／ひぐらしのなく頃に製作委員会",
    cast: "前原圭一:保志総一朗／竜宮レナ:中原麻衣／園崎魅音・詩音:ゆきのさつき／北条沙都子:かないみか／古手梨花:田村ゆかり／大石蔵人:茶風林／富竹ジロウ:大川 透／鷹野三四:伊藤美紀／入江京介:関 俊彦",
    moreLikeThisMovies: moreExampleMovies,
    episodes: allExampleEpisodes,
    trailers: exampleTrailers,
    previewImageName: "ozarkPreview",
    previewVideoURL: exampleVideoURL)

let exampleMovie2 = Movie(
    id: UUID().uuidString,
    name: "Travelers",
    thumbnailUrl: URL(string: "https://picsum.photos/200/301")!,
    categories: exampleCategories,
    year: 2020,
    rating: "TV-MA",
    numberOfSeasons: 3,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creators:"©2020竜騎士07／ひぐらしのなく頃に製作委員会",
    cast: "前原圭一:保志総一朗／竜宮レナ:中原麻衣／園崎魅音・詩音:ゆきのさつき／北条沙都子:かないみか／古手梨花:田村ゆかり／大石蔵人:茶風林／富竹ジロウ:大川 透／鷹野三四:伊藤美紀／入江京介:関 俊彦",
    moreLikeThisMovies: [],
    promotionHeadline: "New episodes coming soon",
    trailers: exampleTrailers,
    previewImageName: "dirtyJohnPreview",
    previewVideoURL: exampleVideoURL)

let exampleMovie3 = Movie(
    id: UUID().uuidString,
    name: "Community",
    thumbnailUrl: URL(string: "https://picsum.photos/200/302")!,
    categories: exampleCategories,
    year: 2020,
    rating: "TV-MA",
    numberOfSeasons: 3,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creators:"©2020竜騎士07／ひぐらしのなく頃に製作委員会",
    cast: "前原圭一:保志総一朗／竜宮レナ:中原麻衣／園崎魅音・詩音:ゆきのさつき／北条沙都子:かないみか／古手梨花:田村ゆかり／大石蔵人:茶風林／富竹ジロウ:大川 透／鷹野三四:伊藤美紀／入江京介:関 俊彦",
    moreLikeThisMovies: [],
    trailers: exampleTrailers,
    previewImageName: "darkPreview",
    previewVideoURL: exampleVideoURL)

let exampleMovie4 = Movie(
    id: UUID().uuidString,
    name: "Python",
    thumbnailUrl: URL(string: "https://picsum.photos/200/303")!,
    categories: exampleCategories,
    year: 2020,
    rating: "TV-MA",
    numberOfSeasons: 3, defaultEpisodeInfo: exampleEpisodeInfo1,
    creators:"©2020竜騎士07／ひぐらしのなく頃に製作委員会",
    cast: "前原圭一:保志総一朗／竜宮レナ:中原麻衣／園崎魅音・詩音:ゆきのさつき／北条沙都子:かないみか／古手梨花:田村ゆかり／大石蔵人:茶風林／富竹ジロウ:大川 透／鷹野三四:伊藤美紀／入江京介:関 俊彦",
    moreLikeThisMovies: [],
    trailers: exampleTrailers,
    previewImageName: "travelersPreview",
    previewVideoURL: exampleVideoURL)

let exampleMovie5 = Movie(
    id: UUID().uuidString,
    name: "Love Swift",
    thumbnailUrl: URL(string: "https://picsum.photos/200/304")!,
    categories: exampleCategories,
    year: 2020,
    rating: "TV-MA",
    numberOfSeasons: 3, defaultEpisodeInfo: exampleEpisodeInfo1,
    creators:"©2020竜騎士07／ひぐらしのなく頃に製作委員会",
    cast: "前原圭一:保志総一朗／竜宮レナ:中原麻衣／園崎魅音・詩音:ゆきのさつき／北条沙都子:かないみか／古手梨花:田村ゆかり／大石蔵人:茶風林／富竹ジロウ:大川 透／鷹野三四:伊藤美紀／入江京介:関 俊彦",
    moreLikeThisMovies: [],
    trailers: exampleTrailers,
    previewImageName: "whiteLinesPreview",
    previewVideoURL: exampleVideoURL)

let exampleMovie6 = Movie(
    id: UUID().uuidString,
    name: "Hate Apple",
    thumbnailUrl: URL(string: "https://picsum.photos/200/305")!,
    categories: exampleCategories,
    year: 2020,
    rating: "TV-MA",
    numberOfSeasons: 6,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creators:"©2020竜騎士07／ひぐらしのなく頃に製作委員会",
    cast: "前原圭一:保志総一朗／竜宮レナ:中原麻衣／園崎魅音・詩音:ゆきのさつき／北条沙都子:かないみか／古手梨花:田村ゆかり／大石蔵人:茶風林／富竹ジロウ:大川 透／鷹野三四:伊藤美紀／入江京介:関 俊彦",
    moreLikeThisMovies: [],
    promotionHeadline: "Watch Season 6 Now",
    trailers: exampleTrailers,
    previewImageName: "arrestedDevPreview",
    previewVideoURL: exampleVideoURL)

var exampleMovies: [Movie] {
    [exampleMovie1, exampleMovie2, exampleMovie3, exampleMovie4, exampleMovie5, exampleMovie6]
}

var moreExampleMovies: [Movie] {
    [exampleMovie2, exampleMovie3, exampleMovie4, exampleMovie5, exampleMovie6]
}
let exampleEpisodeInfo1 = CurrentEpisodeInfo(episodeName: "第1話鬼騙し編　其の壱", description: "昭和五十八年の六月。雛見沢に引っ越してきた圭一は、村に住むレナたちとの新しい生活を楽しんでいた。そんな六月のある日、圭一はダム工事現場の跡地で、偶然出会った写真家の富竹から不穏な話を聞かされる。"
                                             , season: 1, episode: 1)

let episode1 = Episode(name: "第1話鬼騙し編　其の壱",
                       season: 1,
                       episodeNumber: 1,
                       thumbnailImageUrlString: "https://cs1.anime.dmkt-sp.jp/anime_kv/img/24/25/1/0/01/24251001_1_9_8b.png?1601278266000",
                       description: "昭和五十八年の六月。雛見沢に引っ越してきた圭一は、村に住むレナたちとの新しい生活を楽しんでいた。そんな六月のある日、圭一はダム工事現場の跡地で、偶然出会った写真家の富竹から不穏な話を聞かされる。",
                       length: 24,
                       videoUrl: exampleVideoURL)
let episode2 = Episode(name: "第2話鬼騙し編　其の弐",
                       season: 1,
                       episodeNumber: 2,
                       thumbnailImageUrlString: "https://cs1.anime.dmkt-sp.jp/anime_kv/img/24/25/1/0/02/24251002_1_9_8b.png?1601870510000",
                       description: "かつて雛見沢村で起こったダム工事にまつわるバラバラ殺人事件のことを知った圭一は、その日以来、まるで自分を見張るようなレナの視線に気づき、得体の知れない恐怖に苛まれるようになる。",
                       length: 24,
                       videoUrl: exampleVideoURL)
let episode3 = Episode(name: "第3話鬼騙し編　其の参",
                       season: 1,
                       episodeNumber: 3,
                       thumbnailImageUrlString: "https://cs1.anime.dmkt-sp.jp/anime_kv/img/24/25/1/0/03/24251003_1_9_8b.png?1602567009000",
                       description: "綿流しの演舞が終わり、圭一はレナに連れられて沢に降りる。村の守り神・オヤシロさまへの感謝を口にするレナに倣って、圭一も綿を流す。その翌日、圭一の元に大石と名乗る刑事がやってくるのだが…。",
                       length: 24,
                       videoUrl: exampleVideoURL)
let episode4 = Episode(name: "第3話鬼騙し編　其の参",
                       season: 2,
                       episodeNumber: 1,
                       thumbnailImageUrlString: "https://cs1.anime.dmkt-sp.jp/anime_kv/img/24/25/1/0/03/24251003_1_9_8b.png?1602567009000",
                       description: "綿流しの演舞が終わり、圭一はレナに連れられて沢に降りる。村の守り神・オヤシロさまへの感謝を口にするレナに倣って、圭一も綿を流す。その翌日、圭一の元に大石と名乗る刑事がやってくるのだが…。",
                       length: 24,
                       videoUrl: exampleVideoURL)
let episode5 = Episode(name: "第3話鬼騙し編　其の参",
                       season: 2,
                       episodeNumber: 2,
                       thumbnailImageUrlString: "https://cs1.anime.dmkt-sp.jp/anime_kv/img/24/25/1/0/03/24251003_1_9_8b.png?1602567009000",
                       description: "綿流しの演舞が終わり、圭一はレナに連れられて沢に降りる。村の守り神・オヤシロさまへの感謝を口にするレナに倣って、圭一も綿を流す。その翌日、圭一の元に大石と名乗る刑事がやってくるのだが…。",
                       length: 24,
                       videoUrl: exampleVideoURL)

let allExampleEpisodes = [episode1, episode2, episode3, episode4, episode5]



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

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}


extension View {
    
    /// Hide or show the view based on a boolean value.
    ///
    /// Example for visibility:
    /// ```
    /// Text("Label")
    ///     .isHidden(true)
    /// ```
    ///
    /// Example for complete removal:
    /// ```
    /// Text("Label")
    ///     .isHidden(true, remove: true)
    /// ```
    ///
    /// - Parameters:
    ///   - hidden: Set to `false` to show the view. Set to `true` to hide the view.
    ///   - remove: Boolean value indicating whether or not to remove the view.
    @ViewBuilder func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
    }
}
