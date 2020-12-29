//
//  RNVideoProcessingManager.swift
//  RNVideoProcessing
//
//  Created by Shahen Hovhannisyan on 11/14/16.
//

import Foundation
import AVFoundation
import UIKit

@objc(RNVideoProcessingManager)
class RNVideoProcessingManager: RCTViewManager {

   @objc override func view() -> UIView! {
       return RNVideoPlayer()
   }

    @objc override func constantsToExport() -> [AnyHashable: Any] {
        return [
            "ScaleNone": AVLayerVideoGravity.resizeAspect,
            "ScaleToFill": AVLayerVideoGravity.resize,
            "ScaleAspectFit": AVLayerVideoGravity.resizeAspect,
            "ScaleAspectFill": AVLayerVideoGravity.resizeAspectFill
        ]
    }
    
    @objc func setCurrentTimeViaManager(_ node:NSNumber, val:NSNumber) {
      DispatchQueue.main.async {
        let _RNVideoPlayer = self.bridge.uiManager.view(forReactTag: node) as! RNVideoPlayer
        _RNVideoPlayer.setCurrentTime(val)
      }
    }

    override class func requiresMainQueueSetup() -> Bool {
        return true
    }
}
