//
//  State.swift
//  IhrenUI
//
//  Created by Danijel Huis on 07.02.2025..
//

import Foundation

/// Intented to be used as loading status for Views. Do not try to add data or `.empty` case here. Data and loading status must be separate. Look at
/// the example below, View is bound to filteredItems. If `items` were part of the LoadingStatus, then when changing `isShowingFavourites` we would have to
/// change `loadingStatus` also. This is simple example but it can get much more complex, keeping Data and LoadingStatus separate allows us to be flexible for
/// any situation.
///
/// Example:
/// ```
/// struct State {
///     var isShowingFavourites: Bool
///     var loadingStatus: LoadingStatus
///     var items: [Article]
///
///     var filteredItems: [Article] {
///         items.filter { isShowingFavourites ? $0.isFavourite : true }
///     }
/// }
/// ```
///
public enum LoadingStatus {
    case idle
    case loading
    case loaded
    case error
}
