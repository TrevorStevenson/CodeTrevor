//
//  GameCenter.swift
//  CodeTrevor
//
//  Created by Trevor Stevenson on 7/30/17.
//  Copyright © 2017 Triple Torus Software. All rights reserved.
//

import Foundation
import GameKit

extension UIViewController
{
    func authenticateLocalPlayer()
    {
        let localPlayer = GKLocalPlayer.localPlayer()
        
        localPlayer.authenticateHandler = {(viewController: UIViewController?, error: Error?) in
            
            if let VC = viewController { self.present(VC, animated: true, completion: nil) }
            else
            {
                guard localPlayer.isAuthenticated else { return }
                
                localPlayer.loadDefaultLeaderboardIdentifier(completionHandler:nil)
            }
        }
    }
    
    func showLeaderboard(withIdentifier identifier: String)
    {
        let GKVC = GKGameCenterViewController()
        GKVC.gameCenterDelegate = self as? GKGameCenterControllerDelegate
        GKVC.viewState = GKGameCenterViewControllerState.leaderboards
        GKVC.leaderboardIdentifier = identifier
        
        present(GKVC, animated: true, completion: nil)
    }
}
