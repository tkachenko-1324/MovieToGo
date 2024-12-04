//
//  HomeView.swift
//  MovieToGo
//
//  Created by Artem Tkachenko on 12/3/24.
//

import SwiftUI


struct HomeView: View {

    @StateObject private var homeViewModel: HomeViewModel = HomeViewModel()

    var body: some View {
        VStack {
            List(homeViewModel.movies) { movie in
                Section {
                    NavigationLink {
                        MovieDetailView(movieId: movie.id)
                    } label: {
                        MovieItem(movie: movie)
                            .onAppear {
                                if let lastItem = homeViewModel.lastItem, lastItem.id == movie.id {
                                    Task {
                                        await homeViewModel.loadNextPage()
                                    }
                                }
                            }
                    }
                }
            }
            .task {
                await homeViewModel.fetchMovies()
            }
            .overlay {
                if homeViewModel.isLoading {
                    ProgressView()
                }
            }

            if homeViewModel.loadMoreContent {
                ProgressView("Loading...")
            }
        }
        .alert(
            isPresented: $homeViewModel.showErrorAlert,
            error: homeViewModel.networkError,
            actions: { }
        )
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                NavigaionTitleView()
            }
        }
    }
}

#Preview {
    NavigationView {
        HomeView()
    }
}
