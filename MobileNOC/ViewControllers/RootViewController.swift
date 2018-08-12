//
//  RootViewController.swift
//  CLoudConnective
//
//  Created by Munadel Qubbaj on 8/10/18.
//  Copyright © 2018 Munadel Qubbaj. All rights reserved.
//

import UIKit

class RootViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var contentsTableView: UITableView!
    @IBOutlet var customNavBar: UIView!

    private let numberOfRowsInSection = 1
    private let cellSpacingHeight: CGFloat = 15

    private let pageInTableView = 0
    private let pageSize = 10

    override func viewDidLoad() {
        super.viewDidLoad()

        let customNavigationBar = CustomNavigationBarView()
        customNavigationBar.view.frame = customNavBar.bounds
        customNavBar.addSubview(customNavigationBar)

        contentsTableView.register(ContentsTableViewCell.nib(), forCellReuseIdentifier: ContentsTableViewCell.identifier())

        navigationController?.navigationBar.isHidden = true
        APIRequestHandler().fetchDataFromServer(page: pageInTableView, size: pageSize) { (response) in
            self.contentsTableView.reloadData()
        }
    }

    // MARK: - Table View delegate methods

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRowsInSection
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        guard let numberOfSections = DataManager.shared.contentsData.content?.count else { return 0}
        return numberOfSections
    }

    // Set the spacing between sections
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }

    // Make the background color show through
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.backgroundColor = UIColor.clear
        return footerView
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: ContentsTableViewCell.identifier(), for: indexPath) as? ContentsTableViewCell else { return UITableViewCell() }
        cell.configureCell(contentData: DataManager.shared.contentsData.content![indexPath.section])
        cell.selectionStyle = .blue

        let backgroundView = UIView()
        backgroundView.backgroundColor = Constants.cellSelectionColor
        cell.selectedBackgroundView = backgroundView

        return cell
    }


}
