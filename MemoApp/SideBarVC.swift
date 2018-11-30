//  SideBarVC.swift
//  MemoApp
//  Created by 503-26 on 30/11/2018.
//  Copyright © 2018 memo. All rights reserved.

import UIKit

class SideBarVC: UITableViewController {
//출력할 메뉴 이름과 이미지를 배열로 만들기
    let titles = ["메모작성","친구새글","달력보기","공지사항","통계","계정관리"]
    let icons = [UIImage(named: "icon01.png"),
                 UIImage(named: "icon02.png"),
                 UIImage(named: "icon03.png"),
                 UIImage(named: "icon04.png"),
                 UIImage(named: "icon05.png"),
                 UIImage(named: "icon06.png")]
    
//헤더 뷰 배치를 위해서 문자열 2개와 이미지뷰 1개를 인스턴스 변수로 생성
    let nameLabel = UILabel()
    let emailLabel = UILabel()
    let profileImage = UIImageView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 70))
        headerView.backgroundColor = UIColor.brown
        self.tableView.tableHeaderView = headerView
        
        nameLabel.frame = CGRect(x: 70, y: 15, width: 100, height: 30)
        nameLabel.text = "AISDUGO"
        nameLabel.textColor = UIColor.white
        self.nameLabel.backgroundColor = UIColor.clear
        
        emailLabel.frame = CGRect(x: 70, y: 30, width: 180, height: 30)
        emailLabel.text = "aisdugo@gmail.com"
        emailLabel.textColor = UIColor.white
        self.emailLabel.backgroundColor = UIColor.clear

        headerView.addSubview(nameLabel)
        headerView.addSubview(emailLabel)
        
        let defaultProfile = UIImage(named: "account.jpg")
        profileImage.image = defaultProfile
        profileImage.frame = CGRect(x: 10, y: 10, width: 50, height: 50)
        //네모난 이미지 뷰를 둥글게 만들기
        profileImage.layer.cornerRadius = (profileImage.frame.width/2)
        profileImage.layer.borderWidth = 0
        profileImage.layer.masksToBounds = true
        headerView.addSubview(profileImage)
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.titles.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let id = "MenuCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "id") ?? UITableViewCell(style: .default, reuseIdentifier: id)
        
        cell.textLabel?.text = self.titles[indexPath.row]
        cell.imageView?.image = self.icons[indexPath.row]

        return cell
    }
 

}
