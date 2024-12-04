//
//  MovieItem.swift
//  MovieToGo
//
//  Created by Artem Tkachenko on 12/3/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieItem: View {
    var movie: Movie

    var body: some View {
        HStack(
            alignment: .top,
            spacing: 16
        ) {
            WebImage(
                url: movie.posterUrl,
                options: [.progressiveLoad, .delayPlaceholder],
                isAnimating: .constant(true)
            ) { image in
                image
                    .resizable()
            } placeholder: {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(style: .init(lineWidth: 1))
                    .fill(Color.secondary.opacity(0.2))
            }
            .indicator(.activity)
            .clipShape(.rect(cornerRadius: 8))
            .frame(width: 128, height: 188)

            VStack(alignment: .leading, spacing: 8) {
                Text(movie.title)
                    .font(.title3)
                    .fontWeight(.bold)

                Text(movie.overview)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)

                Text("Release: \(movie.releaseDate)")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.accent)
            }
            .fixedSize(horizontal: false, vertical: true)
        }
    }
}

#Preview {
    MovieItem(
        movie: Movie(
            id: 481848,
            title: "Marvel's Black Panther",
            overview: "After he and his wife are murdered, marine Ray Garrison is resurrected by a team of scientists. Enhanced with nanotechnology, he becomes a superhuman, biotech killing machine—'Bloodshot'. As Ray first trains with fellow super-soldiers, he cannot recall anything from his former life. But when his memories flood back and he remembers the man that killed both him and his wife, he breaks out of the facility to get revenge, only to discover that there's more to the conspiracy than he thought.",
            posterUrl: URL(string: "https://image.tmdb.org/t/p/w500/8WUVHemHFH2ZIP6NWkwlHWsyrEL.jpg"),
            backdropUrl: nil,
            releaseDate: "2020-02-19",
            voteAverage: 7.9
        )
    )
}
