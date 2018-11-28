//
//  MemoFormVC.swift
//  MemoApp
//
//  Created by 503-26 on 28/11/2018.
//  Copyright © 2018 memo. All rights reserved.
//

import UIKit

class MemoFormVC: UIViewController {
    var subject : String!
    //이미지 피커의 타입을 매개변수로 받아서 이미지 피커를 출력해주는 사용자 정의 메소드
    func presentPicker(source : UIImagePickerController.SourceType){
        //유효한 소스 타입이 아니면 중단
        guard UIImagePickerController.isSourceTypeAvailable(source) == true else{
            let alert = UIAlertController(title: "사용할 수 없는 타입입니다.", message: nil, preferredStyle: .alert)
            let cancel = UIAlertAction(title: "확인", style: .cancel)
            alert.addAction(cancel)
            self.present(alert, animated: false)
            return
            
        }
        
        //이미지 피커 출력
        let picker = UIImagePickerController()
        picker.delegate = self //delegate를 설정하면 상속받은 걸 구현해야 하는데 extension으로 구현.
        //이미지피커는 넘어온 사진을 사용해야 해서 UINavigationControllerDelegate를 같이 써주어야 한다.
        picker.allowsEditing = true
        picker.sourceType = source
        
        self.present(picker, animated: true)
    }

    @IBOutlet weak var preview: UIImageView!
    @IBOutlet weak var contents: UITextView!
    @IBAction func save(_ sender: Any) {
    }
    @IBAction func pick(_ sender: Any) {
        let select = UIAlertController(title: "이미지를 가져올 곳을 선택하세요!", message: nil, preferredStyle: .actionSheet) //엑션시트는 아래서 위로 올라옴
        select.addAction(UIAlertAction(title: "카메라", style: .default){(_) in self.presentPicker(source: .camera)})
        select.addAction(UIAlertAction(title: "앨범", style: .default){(_) in self.presentPicker(source: .savedPhotosAlbum)})
        select.addAction(UIAlertAction(title: "사진라이브러리", style: .default){(_) in self.presentPicker(source: .photoLibrary)})
        self.present(select, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.contents.delegate = self
    }

}
extension MemoFormVC : UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    //이미지를 선택했을 때 호출되는 메소드
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        self.preview.image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        picker.dismiss(animated: true)
    }
}
extension MemoFormVC : UITextViewDelegate{
    //텍스트를 입력하는 도중에 호출되는 메소드
    func textViewDidChange(_ textView: UITextView){
        //입력된 문자열을 가져오기 - 사용하기 편리하게 하기 위해서 형변환
        let contents = self.contents.text as NSString
        //글자수가 15자가 넘으면 15, 그렇지 않으면 글자수를 저장
        let length = (contents.length > 15) ? 15 : contents.length
        self.subject = contents.substring(with: NSRange(location: 0, length: length))
        self.navigationItem.title = subject
    }
}
