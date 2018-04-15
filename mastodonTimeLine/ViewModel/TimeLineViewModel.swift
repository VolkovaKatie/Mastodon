//
//  TimeLineViewModel.swift
//  mastodonTimeLine
//
//  Created by Екатерина Волкова on 13/04/2018.
//  Copyright © 2018 VolkovaKatie. All rights reserved.
//

import Foundation
import Moya

class TimeLineViewModel {
    private let api: APIProtocol
    
    init(api: APIProtocol = API()) {
        self.api = api
    }
    
    var reloadTableViewClosure: (() -> Void)?
    
    private var cellViewModels: [TimeLineCellViewModel] = [TimeLineCellViewModel]() {
        didSet {
            self.reloadTableViewClosure?()
        }
    }
    
    var numberOfTableViewRows: Int {
        get {
            return cellViewModels.count
        }
    }
    
    func requestTimeLine() {
        self.api.timeline { result in
            switch result {
            case .success(let timeline):
                self.generateCellViewModel(from: timeline)
            case .error(let error):
                print(error)
            }
        }
    }
    
    func generateCellViewModel(from statusData: [Status]) {
        cellViewModels = statusData.map({ (status) -> TimeLineCellViewModel in
            let cellViewModel = TimeLineCellViewModel(status: status)
            return cellViewModel
        })
    }
    
    func getCellViewModel(at indexPath: IndexPath) -> TimeLineCellViewModel {
        return self.cellViewModels[indexPath.row]
    }
}
