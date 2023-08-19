//
//  TableViewCell.swift
//  CleanArchitecture
//
//  Created by yongbeomkwak on 2023/08/18.
//

import UIKit
import SnapKit
import Then

public class TableViewCell: UITableViewCell {

    static let identifier = "tableViewCell"
    
    lazy var label = UILabel().then({
        
        
        $0.font = .systemFont(ofSize: 32)
        $0.textColor = .black
        $0.backgroundColor = .red
        
    })
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError("")
    }
    
    
    private func configureUI(){
        
        contentView.addSubview(label)
        
        label.snp.makeConstraints {

            $0.left.right.top.bottom.equalToSuperview().inset(20)
            
        }
    }
    
    public func update(str:String){
        

        label.text = str
        
        
    }

}


