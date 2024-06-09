//
//  APBudgetView.swift
//  Apto91
//
//  Created by Henrique Alves Batochi on 08/06/24.
//

import UIKit

class APBudgetView: UIView {

    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemOrange
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
}
