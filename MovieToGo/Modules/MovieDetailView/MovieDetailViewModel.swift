//
//  MovieDetailViewModel.swift
//  MovieToGo
//
//  Created by Artem Tkachenko on 12/4/24.
//

import Combine

final class MovieDetailViewModel: ObservableObject {

    // MARK: - Properties

    @Published var movie: Movie?
    @Published var presentTitleAlert: Bool = false
    @Published var isLoading: Bool = false

    private let requestManager: RequestManagerProtocol = RequestManager()

    var networkError: NetworkError?
    @Published var showErrorAlert: Bool = false

    var movieId: Int

    init(
        movieId: Int
    ) {
        self.movieId = movieId
    }

    // MARK: - Actions

    @MainActor
    func fetchMovie() async {
        isLoading = true

        defer { isLoading = false }
        
        do {
            let movieResponse: MovieResponse = try await requestManager.perform(MovieRequests.getMovie(movieId))
            movie = Movie(response: movieResponse)
        } catch {
            setErrorAlert(error as? NetworkError)
        }
    }

    private func setErrorAlert(_ error: NetworkError?) {
        self.networkError = error
        self.showErrorAlert = true
    }
}
