//
//  ViewController.swift
//  RSPGame
//
//  Created by 박다미 on 2022/10/11.
//

import UIKit

class ViewController: UIViewController {

    //변수
    @IBOutlet weak var mainLable: UILabel!
    
    @IBOutlet weak var comImgView: UIImageView!
    @IBOutlet weak var myImgView: UIImageView!
    
    
    @IBOutlet weak var comChoiceLable: UILabel!
    @IBOutlet weak var myChoiceLable: UILabel!
    
    var comChoice:Rps = Rps(rawValue : Int.random(in: 0...2))!
    var myChoice:Rps = Rps.rock
    
    //함수
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //첫번째 두번째 img에 묵 이미지로 준비
        comImgView.image = #imageLiteral(resourceName: "ready")
        myImgView.image = UIImage(named: "ready.png")
        
        //첫번째 두번째 lable에 "준비"라는 문자열 띄우기
        comChoiceLable.text = "준비"
        myChoiceLable.text = "준비"
       
        
    }

    @IBAction func rpsBtnTapped(_ sender: UIButton) {
        //함수 1개에 여러개 연결 가능
        
        //가위바위보 선택한 정보 저장. --> select 눌러야 실시 (enum)열거형
        guard let title = sender.currentTitle else {return}
        //let title = sender.currentTitle!
        print(title)
    
        switch title {
        case "가위":
            myChoice = Rps.scissors
            
        case "바위":
            myChoice = Rps.rock
            
        case "보":
            myChoice = Rps.paper
            
        default:
            break
        }
        
        
       
    
    
    }
    
    
    @IBAction func selectBtnTapped(_ sender: UIButton) {
        
        
        //1) 컴퓨터의 선택에 랜덤선택 이미지와 문자 표시
        switch comChoice {
        case Rps.scissors:
            comChoiceLable.text = "가위"
            comImgView.image = #imageLiteral(resourceName: "scissors")
        case Rps.rock:
            comChoiceLable.text = "바위"
            comImgView.image = #imageLiteral(resourceName: "rock")
        case Rps.paper:
            comChoiceLable.text = "보"
            comImgView.image = #imageLiteral(resourceName: "paper")
            
        }
        //2) 내가 선택한 이미지와 문자 표시
        switch myChoice {
        case Rps.scissors:
            myChoiceLable.text = "가위"
            myImgView.image = #imageLiteral(resourceName: "scissors")
        case Rps.rock:
            myChoiceLable.text = "바위"
            myImgView.image = #imageLiteral(resourceName: "rock")
        case Rps.paper:
            myChoiceLable.text = "보"
            myImgView.image = #imageLiteral(resourceName: "paper")
            
        }
        
        
        //3)비교해서 승 패 여부 표시
        if comChoice == myChoice{
            mainLable.text="비겼다"
            
        }
        else if comChoice == .rock && myChoice == .paper
        {
            mainLable.text = "이겼다"
        }
        else if comChoice == .paper && myChoice == .scissors{
            mainLable.text = "이겼다"
        }
        else if comChoice == .scissors && myChoice == .rock{
            mainLable.text = "이겼다"
        }
        
        
        else if comChoice == .rock && myChoice == .scissors{
        
            mainLable.text = "졌다"
        }
        else if comChoice == .scissors && myChoice == .paper{
            mainLable.text = "졌다"
                    }
        else if comChoice == .paper && myChoice == .rock{
            mainLable.text = "졌다"
        }
        
            
            
            
        
        
        
        
    }
    
    @IBAction func resetBtnTapped(_ sender: UIButton) {
        
        //1) 컴퓨터와 내 선택에 "준비상태" 이미지와 문자 표시
        comImgView.image = #imageLiteral(resourceName: "ready")
        myImgView.image = #imageLiteral(resourceName: "ready")
        

        comChoiceLable.text = "준비"
        myChoiceLable.text = "준비"
        //3) 승 패 여부 말고 "선택하세요"라고 변환
        mainLable.text = "선택하세요"
        
        //4) 컴퓨터가 다시 랜덤 값 설정
        comChoice = Rps(rawValue: Int.random(in: 0...2))!
        
    }
    

}

