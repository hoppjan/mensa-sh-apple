extension Sequence where Iterator.Element: Hashable {
    func unique() -> [Iterator.Element] {
        return Array(Set(self))
    }
}
