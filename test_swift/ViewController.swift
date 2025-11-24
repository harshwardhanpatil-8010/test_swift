//
//  ViewController.swift
//  test_swift
//
//  Created by SDC-USER on 23/11/25.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var videoView: WKWebView!
    let videoID = "E42TfodDzUk"
    override func viewDidLoad() {
           super.viewDidLoad()
    
           loadYouTubeVideo()
       }

    
    func loadYouTubeVideo() {
        let audioUnlocked = UserDefaults.standard.bool(forKey: "audioUnlocked")
        let muteParam = audioUnlocked ? "0" : "1"  // 0 = sound ON

        let urlString = """
        https://www.youtube.com/embed/\(videoID)?autoplay=1&mute=\(muteParam)&loop=1&controls=0&playlist=\(videoID)&playsinline=1
        """

        let request = URLRequest(url: URL(string: urlString)!)
        videoView.configuration.allowsInlineMediaPlayback = true
        videoView.load(request)
    }

    @IBAction func skipButtonTapped(_ sender: UIButton) {
           print("Skipped to next video (you can navigate here)")
       }

       @IBAction func doneButtonTapped(_ sender: UIButton) {
           print("Done button pressed (navigate to results or next screen)")
       }
}

