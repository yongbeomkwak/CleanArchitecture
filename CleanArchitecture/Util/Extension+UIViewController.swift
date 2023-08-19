//
//  Extension+ViewController.swift
//  CleanArchitecture
//
//  Created by yongbeomkwak on 2023/08/19.
//

import Foundation

import SwiftUI


#if DEBUG
public extension UIViewController {
    private struct Preview: UIViewControllerRepresentable {
            let viewController: UIViewController

            func makeUIViewController(context: Context) -> UIViewController {
                return viewController
            }

            func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
            }
        }

        func toPreview() -> some View {
            Preview(viewController: self)
        }
}
#endif
