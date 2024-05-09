//
//  TrendResultView.swift
//  MyMovie
//
//  Created by 민지은 on 2024/05/09.
//

import SwiftUI

struct TrendResultView: View {
    
    @StateObject var viewModel = TrendViewModel()
    
    var body: some View {
        ScrollView{
            VStack(spacing: 50){
                ForEach(viewModel.output.trendingList, id: \.id) { item in
                    TrendView(tv: item)
                }
            }
        }
        .task {
            viewModel.input.viewOnAppear.send(())
        }
    }
}

#Preview {
    TrendResultView()
}
