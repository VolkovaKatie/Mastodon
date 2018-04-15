//
//  StatusView.swift
//  mastodonTimeLine
//
//  Created by Екатерина Волкова on 14/04/2018.
//  Copyright © 2018 VolkovaKatie. All rights reserved.
//

import Foundation
import UIKit

class StatusView: UIViewController {
    @IBOutlet weak var tableview: UITableView! {
        didSet {
            self.tableview.delegate = self
            self.tableview.dataSource = self
            self.tableview.tableFooterView = UIView()
            let headerNib = UINib(nibName: "StatusHeaderCell", bundle: nil)
            let mediaNib = UINib(nibName: "StatusMediaCell", bundle: nil)
            self.tableview.register(headerNib, forCellReuseIdentifier: StatusHeaderCell.getCellID())
            self.tableview.register(mediaNib, forCellReuseIdentifier: StatusMediaCell.getCellID())
        }
    }
    
    private var cellViewModel: TimeLineCellViewModel
    
    init(with statusCellViewModel: TimeLineCellViewModel) {
        self.cellViewModel = statusCellViewModel
        super.init(nibName: "StatusView", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isTranslucent = false
    }
}

extension StatusView: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cellViewModel.isAttachmantExists ? 2 : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch(indexPath.row) {
        case 0:
            let headerCell = tableView.dequeueReusableCell(withIdentifier: StatusHeaderCell.getCellID(), for: indexPath) as! StatusHeaderCell
            headerCell.fillCell(with: self.cellViewModel)
            return headerCell
        case 1:
            let mediaCell = tableView.dequeueReusableCell(withIdentifier: StatusMediaCell.getCellID(), for: indexPath) as! StatusMediaCell
            mediaCell.fillCell(with: self.cellViewModel)
            return mediaCell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        switch(indexPath.row) {
        case 0 :
            return UITableViewAutomaticDimension
        case 1:
            return self.cellViewModel.isAttachmantExists ? 150 : 0
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch(indexPath.row) {
        case 0 :
            return UITableViewAutomaticDimension
        case 1:
            return self.cellViewModel.isAttachmantExists ? 150 : 0
        default:
            return 0
        }
    }
}
