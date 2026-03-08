# Contributing to maple-benefits

Thank you for helping make Canada's benefits more accessible to newcomers.

There are two ways to contribute — **you don't need to know how to code for either one**.

---

## Option 1: Update or add provincial benefit data (no code required)

This is the most valuable contribution. If you live in a province other than BC, or you've noticed our data is outdated, you can contribute by editing a JSON file.

### Steps

1. Fork this repository on GitHub
2. Navigate to `data/provinces/`
3. Copy `BC.json` as a starting template
4. Rename it to your province code (e.g. `ON.json`, `AB.json`)
5. Fill in the benefit data following the [data schema](data/SCHEMA.md)
6. Submit a pull request

### Rules for data contributions

- ✅ Every benefit amount **must have a source** — link to the official government page in `_meta.sources`
- ✅ Set `lastVerified` to today's date
- ✅ Use the correct `benefitYear` (e.g. `"2025-26"`)
- ✅ Conditions text should be in **Chinese** (the app is Chinese-first)
- ✅ Dollar amounts in `calculation` must be **numbers**, not strings
- ❌ Do not add benefits you cannot verify with an official source
- ❌ Do not modify `federal.json` without a source — federal data affects all provinces

### What counts as a valid source

- `canada.ca` or `cra-arc.gc.ca` — for federal benefits
- Official provincial government websites (`.gov.bc.ca`, `ontario.ca`, `alberta.ca`, etc.)
- CRA benefit calculation sheets

Blog posts, news articles, and calculators are **not** acceptable as primary sources (but can be used to cross-check).

---

## Option 2: Report a bug or outdated data

If you received a different benefit amount than what the tool shows, or you know a policy has changed:

1. Open a GitHub Issue
2. Include:
   - Which benefit (e.g. "BC Family Benefit")
   - What the tool shows vs. what the correct amount is
   - A link to the official source confirming the correct amount

---

## For developers: code contributions

The entire app is a single `index.html` file. This is intentional — it keeps the tool accessible to non-technical users who can just download and open it.

### Local development

```bash
# No build step required — just open the file
open index.html
```

### Build script (after editing JSON data)

```bash
# Injects updated JSON data into index.html
./build.sh
```

Run this after any change to `data/*.json` or `data/provinces/*.json`.

### What we accept

- Bug fixes with a test case described in the PR
- Data accuracy fixes (with source)
- UI improvements that don't break the single-file constraint
- New province data files

### What we don't accept

- Breaking the offline / single-file functionality
- Adding backend dependencies
- Removing the AI disclaimer banners
- Changes that reduce the accuracy of the calculation engine without a cited reason

---

## Code of conduct

This project serves a vulnerable population — newcomers navigating an unfamiliar system in a new country. Please be respectful, patient, and accurate. When in doubt, err on the side of caution: it's better to say "verify with CRA" than to show a wrong number.
