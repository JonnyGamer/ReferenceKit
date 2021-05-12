# ReferenceKit
Create a reference on any Swift value

---

**Requirements:**
- Swift 5.4 (will be using the new update for `@propertyWrapper`)



# Example

```swift
func testReference() {

    var foo = 2
    
    // Create and edit the Reference
    @Reference var this = &foo
    this += this
    this += 10
    this *= 1000
    
    print(foo)
    assert(foo != 2)
    assert(foo == 14000)

}
```

---

Note that:
> Property wrappers are not yet supported in top-level code
