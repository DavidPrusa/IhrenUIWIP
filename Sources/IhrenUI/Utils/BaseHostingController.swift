//
//  BaseHostingController.swift
//  IhrenUI
//

import SwiftUI

public final class BaseHostingController<Content>: UIHostingController<Content> where Content: View {

    public override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        .portrait
    }

    public override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        .portrait
    }
}
