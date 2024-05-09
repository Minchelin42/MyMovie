//
//  TrendViewModel.swift
//  MyMovie
//
//  Created by 민지은 on 2024/05/10.
//

import Foundation
import Combine

class TrendViewModel: ViewModelType {
    
    var cancellables = Set<AnyCancellable>()
    
    var input = Input()
    
    @Published var output = Output()

    init() {
        transform()
    }
}


extension TrendViewModel {
    struct Input {
        var viewOnAppear = PassthroughSubject<Void, Never>()
    }
    
    struct Output {
        var trendingList: [TV] = []
    }
    
    func transform() {
        input.viewOnAppear
            .sink { [weak self] _ in
                guard let self else { return }
                Task {
                    try? await self.fetchTrending()
                }
            }
            .store(in: &cancellables)
    }
    
    func fetchTrending() async throws {
        do {
            output.trendingList = try await Network.shared.requestTrendAPI().results
        } catch {
            output.trendingList = []
        }
    }
}
