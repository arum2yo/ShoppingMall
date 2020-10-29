//
//  ColorProvider.swift
//  ShoppingMall
//
//  Created by Ahreum CHO on 2020/10/10.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//

import UIKit

enum AssetsColor {
  //텍스트필드 테두리 부분
  case textFieldLine
  // 버튼 컬러
  case defaultGrayColor
  
  // selected Button color
  case bluePurple
  
}

extension UIColor {
  static func appColor(_ name: AssetsColor) -> UIColor {
    switch name {
    case .textFieldLine:
      return UIColor(white: 238.0 / 255.0, alpha: 1.0)
    case .defaultGrayColor:
        return UIColor(red: 183.0 / 255.0, green: 190.0 / 255.0, blue: 196.0 / 255.0, alpha: 1.0)
    case .bluePurple:
        return UIColor(red: 93.0 / 255.0, green: 46.0 / 255.0, blue: 209.0 / 255.0, alpha: 1.0)

    }
  }
}
