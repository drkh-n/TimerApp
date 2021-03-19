//
//  SecondViewController.swift
//  Timer
//
//  Created by Darkhan on 19.03.2021.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var btnView: UIBarButtonItem!

    var timer = Timer()
    var time: Int = 120
    var isTimerRun = false
    var maxTime = 0
    var check = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        time = maxTime
        progressView.progress = 0
        label.text = timeToString(intTime: time)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        timer.invalidate()
    }
    
    @objc func timeCount() {
        label.text = timeToString(intTime: time)
        if time == 0 {
            timer.invalidate()
            isTimerRun = false
            return
        }
        time -= 1
        progressView.progress = 1 - Float(time)/Float(maxTime)
    }
    
    @IBAction func playButton(_ sender: Any) {
        check = !check
        if check == true {
            if isTimerRun {
                return
            }
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timeCount), userInfo: nil, repeats: true)
            isTimerRun = true
            progressView.progress = 0
            btnView.image = UIImage(systemName: "pause.fill")
        } else {
            timer.invalidate()
            isTimerRun = false
            btnView.image = UIImage(systemName: "play.fill")
        }
    }
    
    @IBAction func restartButton(_ sender: Any) {
        timer.invalidate()
        isTimerRun = false
        time = maxTime
        playButton((Any).self)
    }

    func timeToString(intTime: Int) -> String {
        let seconds = intTime % 60
        let minutes = (intTime / 60) % 60
        let hours = intTime / 3600
        return String(format: "%0.2d:%0.2d:%0.2d", hours, minutes, seconds)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
