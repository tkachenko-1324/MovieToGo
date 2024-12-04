//  MovieToGo
//
//  Created by Artem Tkachenko on 12/2/24.
//

import SwiftUI

struct NavigaionTitleView: View {
    var body: some View {
        HStack(spacing: 1) {
            Text("MOVIE to G")
                .fontWeight(.semibold)
                .font(.system(size: 16))
            Image(.cinemaIcon)
                .resizable()
                .frame(width: 16, height: 16)
        }
        .foregroundColor(.accent)
    }
}

