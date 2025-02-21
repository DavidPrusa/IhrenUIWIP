//
//  DefaultColorPalette.swift
//  IhrenUI
//
//  Created by Bruno Benčević on 28.01.2025..
//

import SwiftUI

@MainActor
public struct DefaultColorPalette: ColorPalette {
    public init() {}
    
    // These shouldn't be called white/black but keeping it to match Figma.
    /// 0xFFFFFFFF
    public var white = Color.white
    /// 0xFF000000
    public var black = Color.black
    /// 0xFFF2F2F2
    public var screenBg = Color(argb: 0xFFF2F2F2)
    /// 0xFFF2F2F2
    public var darkBg = Color(argb: 0xFFF2F2F2)
    /// 0xFFFFFFFF
    public var lightBg = Color(argb: 0xFFFFFFFF)
    /// 0x80000000
    public var backdrop = Color(argb: 0x80000000)

    /// 0xFFE73439
    public var primary: Color { primary500 }
    /// 0xFFFDEDED
    public var primary50 = Color(argb: 0xFFFDEDED)
    /// 0xFFF9DCDD
    public var primary100 = Color(argb: 0xFFF9DCDD)
    /// 0xFFF3999C
    public var primary200 = Color(argb: 0xFFF3999C)
    /// 0xFFEF787B
    public var primary300 = Color(argb: 0xFFEF787B)
    /// 0xFFEB565A
    public var primary400 = Color(argb: 0xFFEB565A)
    /// 0xFFE73439
    public var primary500 = Color(argb: 0xFFE73439)
    /// 0xFF9A2326
    public var primary600 = Color(argb: 0xFF9A2326)
    /// 0xFF741A1D
    public var primary700 = Color(argb: 0xFF741A1D)
    /// 0xFF4D1113
    public var primary800 = Color(argb: 0xFF4D1113)
    /// 0xFF2E0A0B
    public var primary900 = Color(argb: 0xFF2E0A0B)
    
    /// 0xFF1B4258
    public var secondary: Color { secondary800 }
    /// 0xFFF7F5F1
    public var secondary50 = Color(argb: 0xFFF7F5F1)
    /// 0xFFBCD6E5
    public var secondary100 = Color(argb: 0xFFBCD6E5)
    /// 0xFF9AC1D7
    public var secondary200 = Color(argb: 0xFF9AC1D7)
    /// 0xFF79ADCA
    public var secondary300 = Color(argb: 0xFF79ADCA)
    /// 0xFF5898BD
    public var secondary400 = Color(argb: 0xFF5898BD)
    /// 0xFF3684B0
    public var secondary500 = Color(argb: 0xFF3684B0)
    /// 0xFF2D6E93
    public var secondary600 = Color(argb: 0xFF2D6E93)
    /// 0xFF245875
    public var secondary700 = Color(argb: 0xFF245875)
    /// 0xFF1B4258
    public var secondary800 = Color(argb: 0xFF1B4258)
    /// 0xFF122C3B
    public var secondary900 = Color(argb: 0xFF122C3B)
    
    /// 0xFF262626
    public var grey: Color { grey600 }
    /// 0xFFFFFFFF
    public var grey50 = Color(argb: 0xFFFFFFFF)
    /// 0xFFF2F2F2
    public var grey100 = Color(argb: 0xFFF2F2F2)
    /// 0xFFDDDDDD
    public var grey200 = Color(argb: 0xFFDDDDDD)
    /// 0xFFBBBBBB
    public var grey300 = Color(argb: 0xFFBBBBBB)
    /// 0xFF999999
    public var grey400 = Color(argb: 0xFF999999)
    /// 0xFF777777
    public var grey500 = Color(argb: 0xFF777777)
    /// 0xFF555555
    public var grey600 = Color(argb: 0xFF555555)
    /// 0xFF444444
    public var grey700 = Color(argb: 0xFF444444)
    /// 0xFF262626
    public var grey800 = Color(argb: 0xFF262626)
    /// 0xFF000000
    public var grey900 = Color(argb: 0xFF000000)
    
    /// 0xFF248232
    public var success: Color { success500 }
    /// 0xFFEAFDDC
    public var success50 = Color(argb: 0xFFEAFDDC)
    /// 0xFFCBF0D0
    public var success100 = Color(argb: 0xFFCBF0D0)
    /// 0xFF97E2A2
    public var success200 = Color(argb: 0xFF97E2A2)
    /// 0xFF5CC16B
    public var success300 = Color(argb: 0xFF5CC16B)
    /// 0xFF2B9D3C
    public var success400 = Color(argb: 0xFF2B9D3C)
    /// 0xFF248232
    public var success500 = Color(argb: 0xFF248232)
    /// 0xFF1D6828
    public var success600 = Color(argb: 0xFF1D6828)
    /// 0xFF164E1E
    public var success700 = Color(argb: 0xFF164E1E)
    /// 0xFF0E3414
    public var success800 = Color(argb: 0xFF0E3414)
    /// 0xFF071A0A
    public var success900 = Color(argb: 0xFF071A0A)
    
    /// 0xFF00B9F6
    public var info: Color { info500 }
    /// 0xFFEBFAFF
    public var info50 = Color(argb: 0xFFEBFAFF)
    /// 0xFFD1EFF9
    public var info100 = Color(argb: 0xFFD1EFF9)
    /// 0xFF9AE6FF
    public var info200 = Color(argb: 0xFF9AE6FF)
    /// 0xFF48D1FF
    public var info300 = Color(argb: 0xFF48D1FF)
    /// 0xFF20C7FF
    public var info400 = Color(argb: 0xFF20C7FF)
    /// 0xFF00B9F6
    public var info500 = Color(argb: 0xFF00B9F6)
    /// 0xFF009ACE
    public var info600 = Color(argb: 0xFF009ACE)
    /// 0xFF007CA5
    public var info700 = Color(argb: 0xFF007CA5)
    /// 0xFF005D7D
    public var info800 = Color(argb: 0xFF005D7D)
    /// 0xFF003F54
    public var info900 = Color(argb: 0xFF003F54)
    //#D1F0FA
    /// 0xFFE8B233
    public var warning: Color { warning500 }
    /// 0xFFFFFAF0
    public var warning50 = Color(argb: 0xFFFFFAF0)
    /// 0xFFF7E6BE
    public var warning100 = Color(argb: 0xFFF7E6BE)
    /// 0xFFF6E2B2
    public var warning200 = Color(argb: 0xFFF6E2B2)
    /// 0xFFFFD77B
    public var warning300 = Color(argb: 0xFFFFD77B)
    /// 0xFFEDC15D
    public var warning400 = Color(argb: 0xFFEDC15D)
    /// 0xFFE8B233
    public var warning500 = Color(argb: 0xFFE8B233)
    /// 0xFFC18A0A
    public var warning600 = Color(argb: 0xFFC18A0A)
    /// 0xFFB27C00
    public var warning700 = Color(argb: 0xFFB27C00)
    /// 0xFF704E00
    public var warning800 = Color(argb: 0xFF704E00)
    /// 0xFF332300
    public var warning900 = Color(argb: 0xFF332300)
    
    /// 0xFFDB2B39
    public var error: Color { error500 }
    /// 0xFFFCEEEF
    public var error50 = Color(argb: 0xFFFCEEEF)
    /// 0xFFF7D4D6
    public var error100 = Color(argb: 0xFFF7D4D6)
    /// 0xFFF3B9BE
    public var error200 = Color(argb: 0xFFF3B9BE)
    /// 0xFFEA858D
    public var error300 = Color(argb: 0xFFEA858D)
    /// 0xFFE1515D
    public var error400 = Color(argb: 0xFFE1515D)
    /// 0xFFDB2B39
    public var error500 = Color(argb: 0xFFDB2B39)
    /// 0xFFC0212E
    public var error600 = Color(argb: 0xFFC0212E)
    /// 0xFF9D1B25
    public var error700 = Color(argb: 0xFF9D1B25)
    /// 0xFF7A151D
    public var error800 = Color(argb: 0xFF7A151D)
    /// 0xFF460C11
    public var error900 = Color(argb: 0xFF460C11)
    
    /// @TODO Not in Figma
    public var link = Color(argb: 0xFF3684B0)
    public var productCoupon = Color(argb: 0xFF9454A7)
    public var headline1 = Color(argb: 0xFF283033)    
}
