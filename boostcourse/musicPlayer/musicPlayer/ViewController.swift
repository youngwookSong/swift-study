//
//  ViewController.swift
//  musicPlayer
//
//  Created by 송영욱 on 2021/03/30.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    var player: AVAudioPlayer!
    var timer: Timer!

    @IBAction func button(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected {
            sender.setImage(UIImage(named: "button_pause"), for: UIControl.State.selected)
            self.player?.play()
        } else {
            sender.setImage(UIImage(named: "button_play"), for: UIControl.State.normal)
            self.player?.pause()
        }
        
        if sender.isSelected {
            self.makeAndFireTimer()
        } else {
            self.invalidateTimer()
        }
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        //값이 바뀔때마다
        self.updateTimeLabelText(time: TimeInterval(sender.value))
        if sender.isTracking { return }
        self.player.currentTime = TimeInterval(sender.value)
    }
    
    @IBOutlet weak var buttonOutlet: UIButton!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var slider: UISlider!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializePlayer()
        // Do any additional setup after loading the view.
    }
    
    func initializePlayer() {
        
        //슬라이더 초기화 해주는 함수
        guard let soundAsset: NSDataAsset = NSDataAsset(name: "sound") else {
            print("음원 파일 에셋을 가져올 수 없습니다")
            return
        }
        
        do {
            try self.player = AVAudioPlayer(data: soundAsset.data)
            self.player.delegate = self
        } catch let error as NSError {
            print("플레이어 초기화 실패")
            print("코드 : \(error.code), 메세지 : \(error.localizedDescription)")
        }
        
        self.slider.maximumValue = Float(self.player.duration)
        self.slider.minimumValue = 0
        self.slider.value = Float(self.player.currentTime)
        self.buttonOutlet.isSelected = false
    }
    
    func updateTimeLabelText(time: TimeInterval) {
        let minute: Int = Int(time / 60)
        let second: Int = Int(time.truncatingRemainder(dividingBy: 60))
        let milisecond: Int = Int(time.truncatingRemainder(dividingBy: 1) * 100)
        
        let timeText: String = String(format: "%02ld:%02ld:%02ld", minute, second, milisecond)
        
        self.label.text = timeText
    }
    
    func makeAndFireTimer() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { [unowned self] (timer: Timer) in
          
            if self.slider.isTracking { return }
            
            self.updateTimeLabelText(time: self.player.currentTime)
            self.slider.value = Float(self.player.currentTime)
        })
        self.timer.fire()
    }
    
    func invalidateTimer() {
        self.timer.invalidate()//타이머 멈추기
        self.timer = nil
    }
    
    
    // MARK: AVAudioPlayerDelegate
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        
        guard let error: Error = error else {
            print("오디오 플레이어 디코드 오류발생")
            return
        }
        
        let message: String
        message = "오디오 플레이어 오류 발생 \(error.localizedDescription)"
        
        let alert: UIAlertController = UIAlertController(title: "알림", message: message, preferredStyle: UIAlertController.Style.alert)
        
        let okAction: UIAlertAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default) { (action: UIAlertAction) -> Void in
            
            self.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        self.buttonOutlet.isSelected = false
        self.slider.value = 0
        self.updateTimeLabelText(time: 0)
        self.invalidateTimer()
    }
    


}

