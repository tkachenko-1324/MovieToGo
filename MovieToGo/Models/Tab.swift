//
//  Tab.swift
//  MovieToGo
//
//  Created by Artem Tkachenko on 12/3/24.
//

import SwiftUI

enum TabItem: String {
    case home = "Home"

    @ViewBuilder
    var tabContent: some View {
        switch self {
        case .home:
            VStack {
                Image(systemName: "house")
                Text(self.rawValue)
            }
        }
    }
}
