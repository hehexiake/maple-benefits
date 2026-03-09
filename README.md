# maple-benefits

<img src="docs/logo.png" width="120" alt="maple-benefits logo" align="right">

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Version](https://img.shields.io/badge/version-v1.3-blue)]()
[![Offline Ready](https://img.shields.io/badge/offline-ready-brightgreen)]()
[![No Backend](https://img.shields.io/badge/backend-none-green)]()
[![Languages](https://img.shields.io/badge/lang-EN%20%7C%20中文-red)]()
[![GitHub Pages](https://github.com/tuna-chin/maple-benefits/actions/workflows/pages/pages-build-deployment/badge.svg)](https://tuna-chin.github.io/maple-benefits)

**Canada Benefits Tracker** — A free, open-source tool for new Canadian permanent residents to discover, calculate, and track federal and provincial benefits.

🌐 Bilingual (English / 中文) · 🇨🇦 [**Try it now → tuna-chin.github.io/maple-benefits**](https://tuna-chin.github.io/maple-benefits)

---

## Table of Contents

- [Screenshots](#screenshots)
- [Your data never leaves your device](#-your-data-never-leaves-your-device)
- [What it does](#what-it-does)
- [Why this is different](#why-this-is-different)
- [How to use](#how-to-use)
- [AI features](#ai-features)
- [Data coverage](#data-coverage)
- [Changelog](#changelog)
- [Contributing](#contributing)
- [Disclaimer](#disclaimer)

---

## Screenshots

| Dashboard | Benefits Library | Scenario Diagnosis |
|:---------:|:----------------:|:-----------------:|
| ![Dashboard](docs/screenshots/dashboard.png) | ![Library](docs/screenshots/library.png) | ![Advisor](docs/screenshots/advisor.png) |

---

## 🔒 Your data never leaves your device

Unlike other platforms that require you to create an account or upload personal information to their servers, everything in maple-benefits stays on **your device**:

| What | Where it lives |
|------|---------------|
| Your profile (income, family, status) | Browser `localStorage` — your device only |
| Benefit calculations | Runs entirely in your browser — no backend |
| AI API keys | Memory only — never stored on any server |
| AI analysis results | Sent only to the AI provider you choose (OpenAI / Google / Anthropic) — not to us |
| Usage tracking | None. Zero telemetry. |

You can verify this yourself: the entire app is a single `index.html` file. Open it offline and everything works except AI features. There is no server to send your data to.

---

## What it does

If you recently got your Canadian PR, you're eligible for benefits worth thousands of dollars per year — but they're spread across federal and provincial programs with different eligibility rules, income thresholds, and deadlines.

This tool helps you:

- **Calculate** how much you can actually receive (not just "you might be eligible")
- **Track** your application status across 20 federal and BC benefits
- **Get alerted** about policy changes, deadlines, and likely missed benefits
- **Next Actions panel** — shows exactly what to apply for next, ranked by amount
- **Use AI** to scan your city for local programs and get personalized strategy
- **Bilingual** — full English / 中文 toggle, preference saved in localStorage

---

## Why this is different

| | maple-benefits | canada.ca Benefits Finder | CRA Calculator | Benefits Wayfinder |
|--|--|--|--|--|
| Calculates dollar amounts | ✅ | ❌ | Partial | ❌ |
| Covers federal + provincial | ✅ | Partial | ❌ | ✅ |
| AI-powered local benefit scan | ✅ | ❌ | ❌ | ❌ |
| Works offline, zero backend | ✅ | ❌ | ❌ | ❌ |
| No account required | ✅ | ✅ | ✅ | ❌ |
| Your data stays local | ✅ | ❌ | ❌ | ❌ |
| Bilingual EN / 中文 | ✅ | ❌ | ❌ | ❌ |
| Open source | ✅ | ❌ | ❌ | ❌ |

---

## How to use

**Option 1 — Web (recommended)**
Open [tuna-chin.github.io/maple-benefits](https://tuna-chin.github.io/maple-benefits) in any browser. No install, no account, no sign-up.

**Option 2 — Fully offline**
Download `index.html`, double-click to open. Works 100% offline. AI features require an API key but the rest of the app is fully functional without internet.

---

## AI features

AI is **optional**. The core benefit calculator, tracker, and alerts work completely without it.

If you want AI features, you provide your own API key (OpenAI, Google Gemini, or Anthropic Claude). The key is stored **in memory only** for the current browser session — it is never written to disk, never sent to any server other than the AI provider you choose, and disappears when you close the tab.

With AI you unlock:
- **City benefit scan** — finds municipal and community programs in your city
- **Gap check** — finds benefits you likely qualify for but haven't applied to
- **Cross-benefit optimization** — analyzes how RRSP/FHSA contributions affect your total benefit income
- **Scenario diagnosis** — action plans for life events (new baby, divorce, job loss, buying a home)

---

## Data coverage

| Scope | Status |
|-------|--------|
| Federal (10 benefits) | ✅ Complete, verified 2025-26 |
| British Columbia (10 benefits) | ✅ Complete, verified 2025-26 |
| Ontario | 🚧 Coming soon |
| Other provinces | 🚧 Contributions welcome |

Data is updated annually to align with Canada's benefit year (July–June).

---

## Changelog

### v1.3 (2026-03)
- Full bilingual support (English default + 中文 toggle, persists in localStorage)
- All benefit status tracking now uses internal keys — language-safe and migration-resistant
- Next Actions panel on Dashboard: eligible unapplied benefits ranked by amount
- Library filter bar: All / Pending / Applied+Receiving
- Dashboard stat cards are now clickable shortcuts to filtered views
- Benefit detail view uses language-appropriate `desc_en` / `conditions_en` fields
- Fixed: `dismissAlert`, `selectBenefit`, `toggleStep` crash on interaction
- Fixed: timeline and CCB alert logic broken after language switch

### v1.2.2
- Initial public release

---

## Contributing

We especially need help with **provincial data**. If you live in Ontario, Alberta, Quebec, or another province, you can contribute benefit data without writing any code — just fill in a JSON template.

See [CONTRIBUTING.md](CONTRIBUTING.md) for details.

---

## Disclaimer

This tool is for informational purposes only. Benefit amounts are estimates based on publicly available CRA and provincial government data. This is not tax or legal advice. Always verify with official sources before making financial decisions.

---

## License

MIT — free to use, modify, and distribute. See [LICENSE](LICENSE).
