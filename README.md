# maple-benefits

**Canada PR Life Tracker** — A free, open-source tool for new Canadian permanent residents to discover, calculate, and track federal and provincial benefits.

🇨🇦 [**Try it now → maple-benefits.github.io**](https://maple-benefits.github.io)

---

## What it does

If you recently got your Canadian PR, you're eligible for benefits worth thousands of dollars per year — but they're spread across federal and provincial programs with different eligibility rules, income thresholds, and deadlines.

This tool helps you:

- **Calculate** how much you can actually receive (not just "you might be eligible")
- **Track** your application status across 20+ federal and BC benefits
- **Get alerted** about policy changes, deadlines, and likely missed benefits
- **Use AI** to scan your city for local programs and get personalized strategy — without any chat interface

---

## Why this is different

| | maple-benefits | canada.ca Benefits Finder | CRA Calculator | Benefits Wayfinder |
|--|--|--|--|--|
| Calculates dollar amounts | ✅ | ❌ | Partial | ❌ |
| Covers federal + provincial | ✅ | Partial | ❌ | ✅ |
| AI-powered local benefit scan | ✅ | ❌ | ❌ | ❌ |
| Works offline, zero backend | ✅ | ❌ | ❌ | ❌ |
| Open source | ✅ | ❌ | ❌ | ❌ |

---

## How to use

**Option 1 — Web (recommended)**  
Open [maple-benefits.github.io](https://maple-benefits.github.io) in any browser. No install, no account.

**Option 2 — Offline**  
Download `index.html`, double-click to open. Works fully offline (AI features require an API key).

---

## AI features

The AI features are **optional** and require your own API key (OpenAI, Google Gemini, or Anthropic Claude).

Without AI, the tool is 100% functional — it calculates all benefit amounts, tracks status, and alerts you to changes.

With AI, you unlock:
- **City benefit scan** — AI searches for municipal and community programs in your city (impossible to hardcode for hundreds of cities)
- **Gap check** — finds benefits you likely qualify for but haven't applied to
- **Cross-benefit optimization** — analyzes how RRSP/FHSA contributions affect your total benefit income
- **Scenario diagnosis** — structured action plans for life events (new baby, divorce, job loss, buying a home)

Your API key stays in your browser. It is never sent to any server other than the AI provider you choose.

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

## Contributing

We especially need help with **provincial data** — if you live in Ontario, Alberta, Quebec, or another province and know the local benefits, you can contribute without writing any code.

See [CONTRIBUTING.md](CONTRIBUTING.md) for details.

---

## Disclaimer

This tool is for informational purposes only. Benefit amounts are estimates based on publicly available CRA and provincial government data. This is not tax or legal advice. Always verify with official sources before making financial decisions.

Data is labeled with its effective benefit year. AI-generated content may be outdated — always check the official link provided.

---

## License

MIT — free to use, modify, and distribute. See [LICENSE](LICENSE).
