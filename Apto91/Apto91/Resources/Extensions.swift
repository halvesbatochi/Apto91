//
//  Extensions.swift
//  Apto91
//
//  Created by Henrique Alves Batochi on 21/06/24.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}
