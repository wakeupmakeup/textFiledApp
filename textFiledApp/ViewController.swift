//
//  ViewController.swift
//  textFiledApp
//
//  Created by 김태경 on 2022/11/16.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var textField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self // self는 ViewController를 의미한다.
        setup()
        
        // 텍스트 필드 범위 밖을 터치했을때 키보드가 내려가는 기능.
        // 검색어 How to set the keyboard to go down when you touch the screen in swift
        // https://stackoverflow.com/questions/24126678/close-ios-keyboard-by-touching-anywhere-using-swift
        // swift5에서 사용하는 기능 (viewDidLoad에 추가한다)
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
    }
    
    
    func setup() {
        view.backgroundColor = UIColor.gray
        
        textField.keyboardType = UIKeyboardType.emailAddress
        textField.placeholder = "이메일 입력" // 어떤 것을 입력해야 하는지 알려주는 것.
        textField.borderStyle = .roundedRect // 테두리 모양 설정.
        textField.clearButtonMode = .always  // 텍스트 필드에 클리어 버튼 만들기
        textField.returnKeyType = .go
        
        textField.becomeFirstResponder()
        
    }
    
//    // 텍스트필드의 입력을 시작할때 호출 (사작할지 말지 여부를 허락하는 것)
//    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
//        print(#function)
//        return true
//    }
//
//    // 유저가 입력하는 시점 파악.
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        print(#function)
//        print("유저가 텍스트필드의 입력을 시작했다.")
//    }
//
//    // 전체 삭제 버튼이 작동되게 할지 말지.
//    func textFieldShouldClear(_ textField: UITextField) -> Bool {
//        print(#function)
//        return true
//    }
    

    // 텍스트필드 글자 내용이 입력 되거나 지워질때마다 읽어 오기.
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let maxLength = 10
        let currentString = (textField.text ?? "") as NSString
        let newString = currentString.replacingCharacters(in: range, with: string)
        
        return newString.count <= maxLength
    }
        //        위 코드는 스오플에서 복붙한 코드
        
        
//                if Int(string) != nil {
//                    return false
//                } else {
//                    // 10글자 이상 입력되는 것을 막는 코드
//                    guard let text = textField.text else { return true }
//                    let newLength = text.count + string.count - range.lenght
//                    return newLenght <= 10
//                }
        
        //        // 또 다른 코드
//                if (textField.text?.count)! + string.count > 10 {
//                    return false
//                } else P
//                    return true
//            }
        //        이것으로 구현하는 방식에는 정답이 없다!
    
        
        // 텍스트필드의 엔터키가 눌러지면 다음 동작을 허락할 것인지 말것인지.
//        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//            print(#function)
//            return true
//        }
    
//
//        // 텍스트필드의 입력이 끝날때 호출 (끝날지 말지를 허락하기)
//        func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
//            print(#function)
//            return true
//        }
    
    
//
//        // 텍스트필드의 입략이 실제 끝났을때 호출(시점)
//        func textFieldDidEndEditing(_ textField: UITextField) {
//            print(#function)
//            print("유저가 텍스트필드의 입력을 끝냈다.")
//        }
        
        
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        
        // 1. done 버튼을 눌렀을때 키보드가 내려가게 하는 기능 구현.
        // textField.becomeFirstResponder()의 반대 기능임.
        textField.resignFirstResponder()
    }
    
  
        
        
        
}

    

