#set page(width: 200pt, height: 100pt)

// Test with function that returns content
#let test-content() = [Test Content]

// This might cause blank bookmarks
#heading(level: 1)[#test-content()]

// Test with plain text
#heading(level: 1)[Plain Text]
