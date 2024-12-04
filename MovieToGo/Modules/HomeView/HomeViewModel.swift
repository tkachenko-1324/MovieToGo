//
//  HomeViewModel.swift
//  MovieToGo
//
//  Created by Artem Tkachenko on 12/4/24.
//
import Combine

final class HomeViewModel: ObservableObject {

    // MARK: - Properties

    @Published var movies: [Movie] = []
    @Published var isLoading: Bool = false
    @Published var loadMoreContent: Bool = false

    var networkError: NetworkError?
    @Published var showErrorAlert: Bool = false

    private var page: Int = 1
    private var totalPages: Int = 0
    var lastItem: Movie?

    private let requestManager: RequestManagerProtocol = RequestManager()

    // MARK: - Actions

    @MainActor
    func fetchMovies() async {
        guard movies.isEmpty else { return }
        isLoading = true

        defer { isLoading = false }

        do {
            let moviesResponse: PaginationResponse<[MovieResponse]> = try await requestManager.perform(
                MovieRequests.getPopular(page: page)
            )
            movies = moviesResponse.results.map { Movie(response: $0) }
            totalPages = moviesResponse.totalPages
            lastItem = movies.last
        } catch {
            self.setErrorAlert(error)
        }
    }

    @MainActor
    func loadNextPage() async {
        defer { loadMoreContent = false }
        guard page != totalPages else { return }

        page += 1
        loadMoreContent = true

        do {
            let moviesResponse: PaginationResponse<[MovieResponse]> = try await requestManager.perform(
                MovieRequests.getPopular(page: page)
            )
            movies += moviesResponse.results.map { Movie(response: $0) }
            lastItem = movies.last
        } catch {
            self.setErrorAlert(error)
        }
    }

    private func setErrorAlert(_ error: Error) {
        self.networkError = error as? NetworkError
        self.showErrorAlert = true
    }
}
