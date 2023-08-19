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

    lazy var tableView =  UITableView().then {
        $0.separatorStyle = .none
        $0.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        

    }
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        configureUI()
        
        tableView.dataSource = self
        tableView.delegate = self
    }


}


extension ViewController {
    
    private func configureUI(){
        
        view.addSubview(textField)
        view.addSubview(tableView)
        
        textField.snp.makeConstraints {


            $0.left.right.equalToSuperview().inset(20)
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(20)
            $0.height.equalTo(50)
            

        }
        
        tableView.snp.makeConstraints{
            
            $0.left.right.equalToSuperview().inset(20)
            $0.top.equalTo(textField.snp.bottom).offset(20)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }

        
    }
    
}

extension ViewController :UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return 100
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
         let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
         
         
         
         cell.update(str: "Hello\(indexPath.row)")
         return cell
     }
}

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("select \(indexPath.row)")
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

