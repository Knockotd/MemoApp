//
//  MemoListVC.swift
//  MemoApp
//
//  Created by 503-26 on 28/11/2018.
//  Copyright © 2018 memo. All rights reserved.
//

import UIKit

class MemoListVC: UITableViewController {
    //AppDelegate 에 대한 참조 변수
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
        //네비게이션 바의 오른쪽에 +버튼 배치
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(MemoListVC.add(_:)))
    }

    //뷰가 출력될 때마다 호출되는 메소드
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    // MARK: - Table view data source
    //섹션의 개수를 설정하는 메소드. 없으면 1을 리턴. 따라서 그룹화를 하지 않을것이라면 삭제 또는 1을 리턴하도록 한다.
        /*
        override func numberOfSections(in tableView: UITableView) -> Int {
            // #warning Incomplete implementation, return the number of sections
            return 1
        }
        */
    //그룹별 행의 개수를 설정하는 메소드
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return appDelegate.memoList.count
    }
    //셀을 설정하는 메소드
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //행번호에 해당하는 데이터를 찾아오기
        let memo = appDelegate.memoList[indexPath.row]
        //image 존재 여부에 따라 셀의 아이디를 설정
        //if indexPath.row % 2 == 0 얼터레이터
        //이미지가 없으면 기본이미지를 보여주던지 안 보여주던지 한다.
        let cellId = memo.image == nil ? "MemoListCell" : "MemoCellWithImage"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! MemoListCell
        //print("subject : \(memo.title!), content : \(memo.content!), regdate : \(memo.regdate!)")
        cell.subject.text = memo.title!
        cell.content.text = memo.content!
        
        //cell?.regdate.text = memo.regdate
        //날짜를 원하는 형식의 문자열로 만들어주는 객체를 생성
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        cell.regdate.text = formatter.string(from: memo.regdate!)
        //어떤 경우에는 존재하고 어떤 경우에는 nil 인 데이터를 사용할 때는 ?를 해서 사용합니다. !는 강제 형변환을 하는 거라서 nil일 경우 실행이 안되어 구분해서 작동시켜야 하므로 안됩니다.
        cell.img?.image = memo.image!
        return cell
    }
    
    //셀의 높이를 설정해주는 메소드 재정의
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
    
    //셀을 선택했을 때 호출되는 메소드
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //행번호에 해당하는 데이터 찾아오기
        let memo = appDelegate.memoList[indexPath.row]
        
        //하위 뷰 만들기
        let memoReadVC = self.storyboard?.instantiateViewController(withIdentifier: "MemoReadVC") as! MemoReadVC
        
        //데이터 넘겨주기
        memoReadVC.memo = memo
        
        //페이지 이동
        self.navigationController?.pushViewController(memoReadVC, animated: true)
    }
    
    //날코딩으로 직접 대입할 때는 @objc를 써주어야 한다.
    @objc func add(_ barButtonItme : UIBarButtonItem){
        //MemoFormVC 화면 출력하기
        let memoFormVC = self.storyboard?.instantiateViewController(withIdentifier: "MemoFormVC") as! MemoFormVC
        memoFormVC.navigationItem.title = "메모 작성"
        //self.navigationItem.backBarButtonItem!.title = "뒤로"
        self.navigationController?.pushViewController(memoFormVC, animated: true)
    }
}
