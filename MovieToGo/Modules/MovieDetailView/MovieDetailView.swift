//
//  MovieDetailView.swift
//  MovieToGo
//
//  Created by Artem Tkachenko on 12/3/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieDetailView: View {
    
    @StateObject private var movieDeteilViewModel: MovieDetailViewModel

    init(
        movieId: Int
    ) {
        _movieDeteilViewModel = StateObject(
            wrappedValue: MovieDetailViewModel(movieId: movieId)
        )
    }

    var body: some View {
        ZStack(alignment: .center) {
            if movieDeteilViewModel.isLoading {
                ProgressView()
            } else if let movie = movieDeteilViewModel.movie {
                ScrollView(.vertical) {
                    VStack(alignment: .leading, spacing: 16) {
                        WebImage(
                            url: movie.backdropUrl,
                            options: [.progressiveLoad, .delayPlaceholder],
                            isAnimating: .constant(true)
                        ) { image in
                            image
                                .resizable()
                                .clipShape(.rect(cornerRadius: 8))
                                .aspectRatio(16/9, contentMode: .fill)
                                .overlay {
                                    PosterOverlay(movie)
                                }
                        } placeholder: {
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(style: .init(lineWidth: 1))
                                .fill(Color.secondary.opacity(0.2))
                                .aspectRatio(16/9, contentMode: .fit)
                        }
                        .indicator(.activity)

                        Text("Description:")
                            .font(.body)
                            .fontWeight(.semibold)

                        Text(movie.overview)
                            .font(.body)
                            .foregroundStyle(.secondary)

                        Text("Release date: \(movie.releaseDate)")
                            .font(.body)
                            .fontWeight(.semibold)
                            .foregroundStyle(.accent)
                    }
                    .padding()
                }
                .alert(movie.title, isPresented: $movieDeteilViewModel.presentTitleAlert) {

                }
            }
        }
        .task {
            await movieDeteilViewModel.fetchMovie()
        }
        .alert(isPresented: $movieDeteilViewModel.showErrorAlert, error: movieDeteilViewModel.networkError) {
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                NavigaionTitleView()
            }
        }
    }

    @ViewBuilder
    private func PosterOverlay(_ movie: Movie) -> some View {
        ZStack(alignment: .center) {
            Button {
                movieDeteilViewModel.presentTitleAlert = true
            } label: {
                Image(systemName: "play.circle")
                    .resizable()
                    .frame(width: 60, height: 60)
            }

            HStack(spacing: 16) {
                Text(movie.title)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                    .foregroundStyle(.white)

                Spacer()

                HStack(spacing: 2) {
                    let value = String(format: "%.1f", movie.voteAverage)

                    Text(value)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)

                    Image(systemName: "star.fill")
                        .foregroundStyle(.accent)
                }
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
            .padding(8)
        }
    }
}

#Preview {
    NavigationView {
        MovieDetailView(movieId: 481848)
    }
}
