# How to add a new province

This guide is for contributors who want to add benefit data for a province other than BC.

**No coding required.** You only need to edit a JSON file.

---

## Step 1: Check what's needed

Before starting, check `data/provinces/` to see if a stub already exists for your province.

- If `ON.json` exists with `"status": "coming-soon"` → build on that stub
- If no file exists → copy `BC.json` as a starting point

## Step 2: Gather official sources

For each benefit, you need the official provincial government page. Examples:

- Ontario: `ontario.ca`, `cra-arc.gc.ca/provincial`
- Alberta: `alberta.ca`
- Quebec: `revenuquebec.ca`, `gouv.qc.ca`

Do not use blog posts or news articles as primary sources.

## Step 3: Fill in the JSON

Open your province file and fill in each benefit following the [data schema](../data/SCHEMA.md).

Minimum required for each benefit:
```json
{
  "id": "ON-P1",
  "cat": "ontario",
  "name": "中文福利名称",
  "en": "English Benefit Name",
  "scope": "provincial",
  "dataAsOf": "2025-26",
  "max": "Maximum amount string",
  "url": "https://official.gov.url",
  "desc": "一两句中文描述。",
  "desc_en": "One or two sentence English description.",
  "conditions": ["条件1（中文）", "条件2"],
  "conditions_en": ["Condition 1 in English", "Condition 2"]
}
```

## Step 4: Set `_meta.status` to `"complete"` or `"partial"`

- `"complete"` = all major provincial benefits for families and newcomers are covered
- `"partial"` = some benefits added, more to come

## Step 5: Update `_meta.lastVerified`

Set to today's date in `YYYY-MM-DD` format.

## Step 6: Submit a PR

Create a pull request with:
- Title: `data: add [Province] benefits (2025-26)`
- Body: list the benefits you added and the official sources used

A maintainer will review for accuracy before merging.

---

## Province priority list (most requested)

1. 🚧 Ontario (ON) — largest immigrant population
2. 🚧 Alberta (AB)
3. 🚧 Quebec (QC) — note: Quebec has its own tax system, more complex
4. 🚧 Manitoba (MB)
5. Other provinces
