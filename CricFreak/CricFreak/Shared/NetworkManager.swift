//
//  NetworkManager.swift
//  CricFreak
//
//  Created by Admin on 26/2/23.
//

import Foundation
import Network
import UIKit

class NetworkManager {

    static let shared = NetworkManager()
    private init() {}

    func monitorNetwork(viewController: UIViewController) {
        let monitor = NWPathMonitor()
        monitor.pathUpdateHandler = { [weak self] path in
            if path.status == .satisfied {
                DispatchQueue.main.async {
                    viewController.loadViewIfNeeded()
                }
            }
            else {
                DispatchQueue.main.async {
                    self?.alertMessage(from: viewController, message: "Check your internet connection!")
                }
            }
        }

        let queue = DispatchQueue(label: "Network")
        monitor.start(queue: queue)
    }

    func alertMessage(from viewController: UIViewController, message: String) {
        let alertController = UIAlertController(title: "Network Error", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { (_) in
            viewController.loadViewIfNeeded()
        }

        alertController.addAction(action)
        viewController.present(alertController, animated: true, completion: nil)
    }
}
