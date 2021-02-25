//
//  ViewController.swift
//  05PickerView
//
//  Created by 김해림 on 2021/02/25.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let MAX_ARRAY_NUM = 10 //이미지 개수
    let PICKER_VIEW_COLUMN = 1 //피커 뷰의 열의 개수
    let PICKER_VIEW_HEIGHT:CGFloat = 80 //피커뷰의 높이를 지정하는 상수
    
    var imageArray = [UIImage?] () //이미지를 담는 배열 생성
    
    var imageFileName = ["1.jpg","2.jpg","3.jpg","4.jpg","5.jpg","6.jpg","7.jpg","8.jpg","9.jpg","10.jpg"]
    //추가한 이미지의 이름과 파일명
    
    @IBOutlet var lblImageFileName: UILabel!
    @IBOutlet var pickerImage: UIPickerView!
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for i in 0 ..< MAX_ARRAY_NUM {
            let image = UIImage(named: imageFileName[i])
            //UIImage타입의 이미지를 생성하여 image 변수에 할당함
            imageArray.append(image)
            //imageArray 배열에 만든 image를 추가함
        }
        
        lblImageFileName.text = imageFileName[0]
        //배열의 첫번째 파일명을 출력
        imageView.image = imageArray[0]
        //배열의 첫번째 이미지를 출력
        
    }
    //returns the number of 'columns' to display
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
        //피커 뷰에게 컴포넌트의 수를 정수 값으로 넘겨주는 델리게이트 메서드, 컴포넌트는 피커 뷰에 표시되는 열의 개수
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return PICKER_VIEW_HEIGHT
    }//피커뷰에게 컴포넌트 높이를 정수 값으로 넘겨주는 메서드
    
    //returns the # of rows in each component..
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFileName.count
        //컴포넌트의 열의 개수를 정수 값으로 넘겨줌, 해당 열에서 선택할 수 있는 행의 개수를 의미, 배열 imageFileName의 개수 값인 10을 넘겨줌
    }
    
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return imageFileName[row]
//        //열의 타이틀을 문자열 값으로 넘겨줌, imageFileName에 저장되어 있는 파일명을 넘겨줌
//    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        //UIView 타입으로 값을 넘겨줌
        let imageView = UIImageView(image: imageArray[row])
        //선택된 row에 해당하는 이미지를 imageArray에서 가져옴
        imageView.frame = CGRect(x:0, y:0, width: 100, height: 150)
        //이미지 뷰의 프레임 크기를 설정
        
        return imageView
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lblImageFileName.text = imageFileName[row]
        //사용자가 선택한 row값을 사용하여 imageFileName배열에서 row값에 해당하는 문자열을 가져와 lblImageFileName에 저장함
        imageView.image = imageArray[row]
        //imageArray에서 row값에 해당하는 이미지를 가져와 imageView.image에 저장함
    }
}

