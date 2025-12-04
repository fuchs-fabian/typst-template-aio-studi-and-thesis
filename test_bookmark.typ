#set page(width: 200pt, height: 200pt)

#let mytext() = [Test Content]

// Standard heading - might have bookmark issue
#heading(level: 1)[#mytext()]

// Try with explicit bookmark using label
#heading(level: 1, bookmarked: true)[#mytext()] <test-label>

// Plain text version
#heading(level: 1)[Test Content]
