# sv-docs

Jekyll docs for KDRS Search & View. Pages in `_docs/`, images in `assets/images/`.

## Writing style

Brief. Cut words that add nothing.

- No lead-in that restates the heading ("The archiver role has been expanded with new capabilities:")
- No "The system will", "X has been improved with:"
- Bullets under a heading drop the repeated subject: "See all users", not "Archivers can see all users"
- Don't describe what the screenshot already shows
- Keep a "why" only when it tells the reader something (e.g. streaming helps large files)

## Headings

Max two levels. `###` renders too small.

## Highlights pages (`_docs/archive/<version>-highlights.md`)

- Every item in that version's `assets/release/release_<version>.html` must be represented
- Link the full release notes once, at the top
- Images: `![](../../assets/images/<version>-highlights/name.png)`
- Screenshots stay in the Norwegian UI even though the prose is English
- Check every image reference resolves before finishing
