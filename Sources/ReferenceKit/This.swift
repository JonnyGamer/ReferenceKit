
@propertyWrapper struct Reference<T> {
    var foo: UnsafeMutablePointer<T>
    var wrappedValue: UnsafeMutablePointer<T> {
        get { foo }
        set { foo = newValue }
    }
    init(wrappedValue: UnsafeMutablePointer<T>) { foo = wrappedValue }
}


// Extensions
extension UnsafeMutablePointer where Pointee: AdditiveArithmetic {
    static func += (lhs: Self, rhs: Pointee) { lhs.pointee += rhs }
    static func += (lhs: Self, rhs: Self) { lhs.pointee += rhs.pointee }
    static func -= (lhs: Self, rhs: Pointee) { lhs.pointee -= rhs }
    static func -= (lhs: Self, rhs: Self) { lhs.pointee -= rhs.pointee }
}
extension UnsafeMutablePointer where Pointee: Numeric {
    static func *= (lhs: Self, rhs: Pointee) { lhs.pointee *= rhs }
    static func *= (lhs: Self, rhs: Self) { lhs.pointee *= rhs.pointee }
}
extension UnsafeMutablePointer where Pointee: FixedWidthInteger {
    static func /= (lhs: Self, rhs: Pointee) { lhs.pointee /= rhs }
    static func /= (lhs: Self, rhs: Self) { lhs.pointee /= rhs.pointee }
}
extension UnsafeMutablePointer where Pointee: FloatingPoint {
    static func += (lhs: Self, rhs: Pointee) { lhs.pointee += rhs }
    static func -= (lhs: Self, rhs: Pointee) { lhs.pointee -= rhs }
    static func *= (lhs: Self, rhs: Pointee) { lhs.pointee *= rhs }
    static func /= (lhs: Self, rhs: Pointee) { lhs.pointee /= rhs }
    static func += (lhs: Self, rhs: Self) { lhs.pointee += rhs.pointee }
    static func -= (lhs: Self, rhs: Self) { lhs.pointee -= rhs.pointee }
    static func *= (lhs: Self, rhs: Self) { lhs.pointee *= rhs.pointee }
    static func /= (lhs: Self, rhs: Self) { lhs.pointee /= rhs.pointee }
}
extension UnsafeMutablePointer where Pointee == String {
    static func += (lhs: Self, rhs: Pointee) { lhs.pointee += rhs }
    static func += (lhs: Self, rhs: Self) { lhs.pointee += rhs.pointee }
    static func *= (lhs: Self, rhs: Int) { lhs.pointee *= rhs }
}
extension String {
    static func *= (lhs: inout Self, rhs: Int) { lhs = String.init(repeating: lhs, count: rhs) }
}

extension UnsafeMutablePointer: CustomStringConvertible {
    public var description: String { return "\(pointee)" }
}

