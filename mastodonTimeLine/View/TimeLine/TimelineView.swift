//
//  ViewController.swift
//  mastodonTimeLine
//
//  Created by Екатерина Волкова on 13/04/2018.
//  Copyright © 2018 VolkovaKatie. All rights reserved.
//

import UIKit

class TimelineView: UIViewController {
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            self.tableView.delegate = self
            self.tableView.dataSource = self
            self.tableView.tableFooterView = UIView()
            let nib = UINib(nibName: "TimeLineCellView", bundle: nil)
            self.tableView.register(nib, forCellReuseIdentifier: TimeLineCellView.getCellID())
            if #available(iOS 10.0, *) {
                self.tableView.refreshControl = pullToRefreshControl
            } else {
                self.tableView.addSubview(pullToRefreshControl)
            }
        }
    }
    
    private let viewModel: TimeLineViewModel
    private let pullToRefreshControl = UIRefreshControl()
    
    init(with viewModel: TimeLineViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "TimelineView", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        self.title = "Local timeline"
        
        self.pullToRefreshControl.addTarget(self, action: #selector(self.reloadTableView), for: .valueChanged)
        self.viewModel.requestTimeLine()
        self.viewModel.reloadTableViewClosure = { [weak self] () in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                self?.pullToRefreshControl.endRefreshing()
            }
        }
    }
    
    @objc func reloadTableView() {
        self.viewModel.requestTimeLine()
    }
}

extension TimelineView: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfTableViewRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: TimeLineCellView.getCellID() , for: indexPath) as? TimeLineCellView {
            let cellVM = self.viewModel.getCellViewModel(at: indexPath)
            cell.fillCellView(with: cellVM)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellVM = self.viewModel.getCellViewModel(at: indexPath)
        let statusVC = StatusView(with: cellVM)
        self.navigationController?.pushViewController(statusVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}

