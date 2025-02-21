//
//  InputFieldViewModel.swift
//  IhrenUI
//

import SwiftUI
import Combine

final class InputFieldViewModel: ObservableObject {

    @Published var fieldText: String
    private var query: Binding<String>
    private var debouncedQuery: Binding<String>?
    private var debounceTime: TimeInterval?

    private var cancellables: Set<AnyCancellable> = []

    static let defaultDebounceTime = 0.25

    init(
        query: Binding<String>,
        debouncedQuery: Binding<String>?,
        debounceTime: TimeInterval?
    ) {
        self.fieldText = query.wrappedValue
        self.query = query

        self._fieldText.projectedValue
            .receive(on: RunLoop.main)
            .sink { [weak self] value in
                self?.query.wrappedValue = value
            }
            .store(in: &cancellables)

        guard let debouncedQuery else { return }
        self.debouncedQuery = debouncedQuery
        let time: TimeInterval = debounceTime ?? Self.defaultDebounceTime

        self._fieldText.projectedValue
            .debounce(for: .seconds(time), scheduler: RunLoop.main)
            .sink { [weak self] value in
                self?.debouncedQuery?.wrappedValue = value
            }
            .store(in: &cancellables)
    }

    func deleteQuery() {
        fieldText = ""
    }
}
