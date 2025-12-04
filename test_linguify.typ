#import "src/packages.typ": package
#import package("linguify"): set-database as initialize-dictionary, linguify

#show: initialize-dictionary(toml("src/lang.toml"))

#set page(width: 300pt, height: 200pt)

// Test linguify output
#let txt = linguify("list-of-abbreviations")

// Display type
Type: #type(txt)

// Display content
Content: #txt

// Try in heading
#heading(level: 1)[#txt]

// Try with plain text
#heading(level: 1)[Abkürzungsverzeichnis]
