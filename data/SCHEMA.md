# Data Schema — maple-benefits

> This document defines the structure of benefit data files in `data/`.  
> To add a new province, copy `BC.json` as a template and fill in your data.

---

## File Structure

```
data/
├── federal.json          # Federal benefits (all provinces)
├── SCHEMA.md             # This file
└── provinces/
    ├── BC.json           # Complete ✅
    ├── ON.json           # Stub, contributions welcome
    └── [PROVINCE].json   # Add yours
```

---

## `_meta` object

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `scope` | `"federal"` \| `"provincial"` | ✅ | Scope of this file |
| `province` | string | Provincial only | 2-letter code (e.g. `"BC"`) |
| `provinceName` | string | Provincial only | Full name |
| `benefitYear` | string | ✅ | e.g. `"2025-26"` |
| `basedOn` | string | ✅ | e.g. `"2024 tax return"` |
| `lastVerified` | `"YYYY-MM-DD"` | ✅ | Date contributor last verified amounts |
| `status` | `"complete"` \| `"coming-soon"` \| `"partial"` | ✅ | Data completeness |
| `sources` | string[] | ✅ | Official URLs used to verify data |
| `notes` | string | — | Any caveats or known issues |

---

## `benefits[]` array — each item

### Required fields

| Field | Type | Description |
|-------|------|-------------|
| `id` | string | Unique ID. Federal: `F1`–`F99`. Provincial: `[CODE]-P1` e.g. `ON-P1` |
| `name` | string | Chinese name (primary display) |
| `en` | string | English name |
| `scope` | `"federal"` \| `"provincial"` | |
| `dataAsOf` | string | Benefit year this data reflects, e.g. `"2025-26"` |
| `max` | string | Human-readable maximum amount string |
| `url` | string | Official government URL |
| `desc` | string | 1–2 sentence description in Chinese |
| `conditions` | string[] | Eligibility conditions list (Chinese) |

### Optional: `calculation` object

Used by the calculation engine in `index.html`. Include as much precision as possible.  
The engine will use these values; missing fields fall back to display-only mode.

| Field | Type | Description |
|-------|------|-------------|
| `type` | string | `"fixed"`, `"sliding-scale"`, `"service-based"`, `"variable"` |
| `maxAnnual` | number | Maximum annual amount in CAD |
| `maxMonthly` | number | Maximum monthly amount in CAD |
| `incomeThreshold` | number | Income at which full amount begins to phase out |
| `phaseOutRate` | number | Phase-out rate (e.g. `0.05` = 5¢ per $1 over threshold) |
| `paymentDates` | string[] | Human-readable payment dates |

> **Rule:** Dollar amounts in `calculation` must be numbers, not strings.  
> The human-readable version goes in `max`.

---

## How the build script uses this data

`build.sh` (run after editing JSON) injects data into `index.html`:

```
json/federal.json  ──┐
json/BC.json       ──┼──► build.sh ──► index.html (BENEFITS array updated)
json/ON.json       ──┘
```

Until `build.sh` is run, `index.html` uses its own embedded BENEFITS array.  
**Always run `build.sh` after editing JSON.**

---

## Contribution rules

1. **Every amount must have a source URL** in `_meta.sources`
2. **`lastVerified` is mandatory** — stale data with no date will be flagged
3. **`conditions` must be in Chinese** (the app UI is Chinese-first)
4. **Don't remove existing fields** — only add or update
5. One PR per province / per benefit year update
