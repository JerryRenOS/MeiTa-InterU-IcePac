//
//  DownloadDelegate.swift
//  Circprogresularity
//
//  Created by Jerry Ren on 1/25/21.
//

import UIKit

extension FrontRunningViewController {
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let byfinbi  = CGFloat(totalBytesWritten) / CGFloat(totalBytesExpectedToWrite)
        DispatchQueue.main.async {
            self.byfinbiDisplay.text = "\(Int(byfinbi * 100))%"
            //     self.circularLayer.strokeEnd = byfinbi / 4.35
            //     syncing download progress with the progress track (not working properly if the download is too fast)
        }
        print(totalBytesWritten, totalBytesExpectedToWrite)
    }
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
    }
}
  
