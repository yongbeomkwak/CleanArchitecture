//
//  ViewController.swift
//  CleanArchitecture
//
//  Created by yongbeomkwak on 2023/08/18.
//

import UIKit
import Then
import SnapKit

class ViewController: UIViewController {
    
    lazy var textField = UITextField().then {
        
       
        $0.placeholder = "Hello"
        $0.textColor = .white
        $0.backgroundColor = .red
        $0.layer.cornerRadius = 20
        $0.clipsToBounds = true
        
    }

        

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Hello")
        
        configureUI()
    }


}


extension ViewController {
    
    private func configureUI(){
        
        view.addSubview(textField)
        
        
        textField.snp.makeConstraints {


            $0.left.right.equalToSuperview().inset(20)
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(20)
            $0.height.equalTo(50)
            

        }

        
    }
    
}

struct ViewController_PreViews: PreviewProvider {
    static var previews: some View {
        ViewController().toPreview()
    }
}


import SwiftUI


#if DEBUG
extension UIViewController {
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

