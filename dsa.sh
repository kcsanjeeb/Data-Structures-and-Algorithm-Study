#!/usr/bin/env bash
set -euo pipefail

# ==========================================================
# DSA Study Scaffolder (Add-anytime) — v4
# - category/problem/solution modes (+ interactive)
# - nounset-safe; macOS Bash 3.2 compatible
# - prompts to create category if missing (y/N)
# - ALWAYS updates root README TOC between markers
# ==========================================================

pad2() { printf "%02d" "$1"; }
nowid() { date "+%Y%m%d-%H%M%S-$RANDOM"; }

trim() {
  local s="${1-}"
  # shellcheck disable=SC2001
  echo -n "$(echo -n "${s}" | sed -e 's/^[[:space:]]\+//' -e 's/[[:space:]]\+$//')"
}

ask() { local prompt="$1" varname="$2" def="${3-}"; local ans; read -r -p "$prompt" ans || true; ans="${ans:-$def}"; printf -v "$varname" "%s" "$ans"; }

ask_yn() {
  local prompt="${1:-Proceed?} [y/N]: "
  local ans
  read -r -p "$prompt" ans || true
  ans="$(printf '%s' "$ans" | tr '[:upper:]' '[:lower:]')"  # mac-safe lowercase
  case "$ans" in
    y|yes) return 0 ;;
    *)     return 1 ;;
  esac
}

csv_to_yaml_list() {
  local raw="${1-}"
  local IFS=,
  local -a parts=()
  local -a out=()
  if [[ -n "${raw}" ]]; then
    read -ra parts <<< "$raw" || true
  fi
  if [[ "${#parts[@]}" -gt 0 ]]; then
    for p in "${parts[@]}"; do
      p="$(trim "$p")"
      [[ -n "$p" ]] && out+=("\"$p\"")
    done
  fi
  local joined; joined=$(IFS=", "; echo "${out[*]-}")
  echo -n "$joined"
}

write_file() {
  local path="$1"
  mkdir -p "$(dirname "$path")"
  cat > "$path"
  echo "  + wrote: $path"
}

append_unique_line() {
  local file="$1" line="$2"
  touch "$file"
  if ! grep -Fqx -- "$line" "$file"; then
    echo "$line" >> "$file"
    echo "  ~ updated: $file"
  fi
}

# ---------------- Templates ----------------

problem_readme_tpl() {
  local id="${1-}" title="$2" tags_csv="${3-}" diff="${4-}"
  [[ -z "$id" ]] && id="$(nowid)"
  local tags_yaml; tags_yaml="$(csv_to_yaml_list "$tags_csv")"
  cat <<EOF
---
id: $id
title: "$title"
tags: [ $tags_yaml ]
difficulty: "$diff"
---

## 🧠 Problem Statement
Define the problem statement here....

#### ▶️ Example 1:
\`\`\`bash
# Place example here ....
\`\`\`

#### ▶️ Example 2:
\`\`\`bash
# Place example here ....
\`\`\`

## 🎯 Constrains
* Define Constrain 1 here ...
* Define Constrain 2 here ...
EOF
}

solution_readme_tpl() {
  local id="${1-}" title="$2" approach="$3" lang="${4-Go}" tags_csv="${5-}"
  [[ -z "$id" ]] && id="$(nowid)"
  local tags_yaml; tags_yaml="$(csv_to_yaml_list "$tags_csv")"
  cat <<EOF
---
id: $id
title: "$title"
approach_type: "$approach"
language: "$lang"
tags: [ $tags_yaml ]
---

## 🔍 Idea
Define the idea here ....

## 🧩 Steps
* 
*
*

## 🧮 Complexity
| Metric  |  Complexity |
|---------|-------------|
| Time    |             |
| Space   |             |

## 🧠 Example Run
\`\`\`go

\`\`\`
\`\`\`bash
Output: 


\`\`\`
EOF
}

main_go_tpl() {
  cat <<'EOF'
// Package main - starter scaffold; replace with your implementation.
package main

import "fmt"

func solve() interface{} {
	// TODO: implement
	return nil
}

func main() {
	fmt.Println("solve() =>", solve())
}
EOF
}

category_readme_init() {
  local catnum="$1" label="${2-}" first_prob_num="${3-}" first_prob_title="${4-}"
  cat <<EOF
# Category-${catnum}${label:+ - $label}

This category groups related DSA problems.

## Problems
${first_prob_num:+- [Problem-${first_prob_num}](./problem-${first_prob_num}/readme.md) – ${first_prob_title}}
EOF
}

# ---------------- Discovery helpers ----------------

next_problem_num() {
  local catdir="$1"
  local max=0 n
  shopt -s nullglob
  for d in "$catdir"/problem-*; do
    [[ -d "$d" ]] || continue
    n="${d##*/problem-}"
    [[ "$n" =~ ^[0-9]{2}$ ]] || continue
    (( 10#$n > max )) && max=$((10#$n))
  done
  pad2 $((max+1))
}

next_solution_num() {
  local probdir="$1"
  local max=0 n
  shopt -s nullglob
  for d in "$probdir"/solution-*; do
    [[ -d "$d" ]] || continue
    n="${d##*/solution-}"
    [[ "$n" =~ ^[0-9]{2}$ ]] || continue
    (( 10#$n > max )) && max=$((10#$n))
  done
  pad2 $((max+1))
}

# prefer readme.md; fallback readme.go
find_readme_file() {
  local dir="$1"
  if [[ -f "$dir/readme.md" ]]; then
    echo "readme.md"
  elif [[ -f "$dir/readme.go" ]]; then
    echo "readme.go"
  else
    echo ""
  fi
}

# extract "title: " from front-matter of a README (md or go)
extract_title() {
  local file="$1"
  # get between the first '---' pair and search title:
  awk '
    BEGIN{inblk=0}
    /^---[[:space:]]*$/{ if(inblk==0){inblk=1;next} else {inblk=0;exit} }
    inblk==1 && $1 ~ /^title:/ {
      sub(/^title:[[:space:]]*/, "", $0);
      gsub(/^"|"$/, "", $0);
      print $0; exit
    }
  ' "$file" 2>/dev/null || true
}

# extract difficulty from problem README
extract_difficulty() {
  local file="$1"
  awk '
    BEGIN{inblk=0}
    /^---[[:space:]]*$/{ if(inblk==0){inblk=1;next} else {inblk=0;exit} }
    inblk==1 && $1 ~ /^difficulty:/ {
      sub(/^difficulty:[[:space:]]*/, "", $0);
      gsub(/^"|"$/, "", $0);
      print $0; exit
    }
  ' "$file" 2>/dev/null || true
}

# extract time/space complexity from solution README table
extract_complexity_cell() {
  local file="$1" which="$2" # "Time" or "Space"
  # find the row starting with | Time or | Space and return 3rd column
  awk -v which="$which" '
    BEGIN{FS="|"}
    $0 ~ /^\|[[:space:]]*Metric/ { next }   # skip header
    $0 ~ /^\|[-[:space:]]*\|/    { next }   # skip divider
    {
      # columns: 1 is empty, 2 is label, 3 is value, last is empty due to pipes
      label=$2; gsub(/^[[:space:]]+|[[:space:]]+$/, "", label);
      if(label==which){
        val=$3; gsub(/^[[:space:]]+|[[:space:]]+$/, "", val);
        print val; exit
      }
    }
  ' "$file" 2>/dev/null || true
}

# ---------------- Root README TOC updater ----------------

update_root_toc() {
  local ROOT_README="readme.md"
  [[ -f "$ROOT_README" ]] || { echo "(!) No readme.md at repo root; skipping TOC update."; return 0; }

  # Ensure markers exist; append once at the end if missing
  if ! grep -q "<!-- TOC:START -->" "$ROOT_README"; then
    {
      echo ""
      echo "<!-- TOC:START -->"
      echo "<!-- TOC:END -->"
    } >> "$ROOT_README"
    echo "  ~ inserted TOC markers in readme.md"
  fi

  # Build TOC into a temp file (markdown)
  local tmp_toc; tmp_toc="$(mktemp)"
  {
    echo "## 🧭 Table of Contents (auto-generated)"
    echo ""
  } > "$tmp_toc"

  local cat_idx=0
  shopt -s nullglob
  for cat in category-*; do
    [[ -d "$cat" ]] || continue
    cat_idx=$((cat_idx+1))
    local cat_num="${cat#category-}"
    local cat_link="./$cat/readme.md"
    local cat_readme="$cat/readme.md"
    local cat_title="Category-$cat_num"

    if [[ -f "$cat_readme" ]]; then
      local t
      t="$(awk '
        BEGIN{inblk=0}
        /^---[[:space:]]*$/{ if(inblk==0){inblk=1;next} else {inblk=0;exit} }
        inblk==1 && $1 ~ /^title:/ {
          sub(/^title:[[:space:]]*/, "", $0); gsub(/^"|"$/, "", $0); print; exit
        }' "$cat_readme" 2>/dev/null || true)"
      if [[ -n "$t" ]]; then
        cat_title="$t"
      else
        t="$(awk '/^# /{sub(/^# /,""); print; exit}' "$cat_readme" 2>/dev/null || true)"
        [[ -n "$t" ]] && cat_title="$t"
      fi
    fi

    {
      echo "### ${cat_idx}. [${cat_title}]($cat_link)"
      echo "| Problem | Solution Approaches | Time Complexity | Space Complexity |"
      echo "| --- | --- | --- | --- |"
    } >> "$tmp_toc"

    for prob in "$cat"/problem-*; do
      [[ -d "$prob" ]] || continue
      local prob_num="${prob##*/problem-}"
      local prob_rm_file=""
      if   [[ -f "$prob/readme.md" ]]; then prob_rm_file="readme.md"
      elif [[ -f "$prob/readme.go" ]]; then prob_rm_file="readme.go"
      fi
      local prob_link="./$prob/$prob_rm_file"
      local prob_title="Problem-$prob_num"

      if [[ -n "$prob_rm_file" ]]; then
        local pt
        pt="$(awk '
          BEGIN{inblk=0}
          /^---[[:space:]]*$/{ if(inblk==0){inblk=1;next} else {inblk=0;exit} }
          inblk==1 && $1 ~ /^title:/ {
            sub(/^title:[[:space:]]*/, "", $0); gsub(/^"|"$/, "", $0); print; exit
          }' "$prob/$prob_rm_file" 2>/dev/null || true)"
        [[ -n "$pt" ]] && prob_title="$pt"
      fi

      local first_row_done=0 any_solution=0
      for sol in "$prob"/solution-*; do
        [[ -d "$sol" ]] || continue
        any_solution=1
        local sol_num="${sol##*/solution-}"
        local sol_rm_file=""
        if   [[ -f "$sol/readme.md" ]]; then sol_rm_file="readme.md"
        elif [[ -f "$sol/readme.go" ]]; then sol_rm_file="readme.go"
        fi
        local sol_link="./$sol/$sol_rm_file"
        local sol_title="Solution-$sol_num"
        local approach="" time_c="" space_c=""

        if [[ -n "$sol_rm_file" ]]; then
          sol_title="$(awk '
            BEGIN{inblk=0}
            /^---[[:space:]]*$/{ if(inblk==0){inblk=1;next} else {inblk=0;exit} }
            inblk==1 && $1 ~ /^title:/ {
              sub(/^title:[[:space:]]*/, "", $0); gsub(/^"|"$/, "", $0); print; exit
            }' "$sol/$sol_rm_file" 2>/dev/null || echo "Solution-$sol_num")"

          approach="$(awk '
            BEGIN{inblk=0}
            /^---[[:space:]]*$/{ if(inblk==0){inblk=1;next} else {inblk=0;exit} }
            inblk==1 && $1 ~ /^approach_type:/ {
              sub(/^approach_type:[[:space:]]*/, "", $0); gsub(/^"|"$/, "", $0); print; exit
            }' "$sol/$sol_rm_file" 2>/dev/null || true)"

          # Complexity cells from the mini table
          time_c="$(awk '
            BEGIN{FS="|"}
            $0 ~ /^\|[[:space:]]*Metric/ {next}
            $0 ~ /^\|[-[:space:]]*\|/ {next}
            {
              lab=$2; gsub(/^[[:space:]]+|[[:space:]]+$/, "", lab);
              if(lab=="Time"){ val=$3; gsub(/^[[:space:]]+|[[:space:]]+$/, "", val); print val; exit }
            }' "$sol/$sol_rm_file" 2>/dev/null || true)"

          space_c="$(awk '
            BEGIN{FS="|"}
            $0 ~ /^\|[[:space:]]*Metric/ {next}
            $0 ~ /^\|[-[:space:]]*\|/ {next}
            {
              lab=$2; gsub(/^[[:space:]]+|[[:space:]]+$/, "", lab);
              if(lab=="Space"){ val=$3; gsub(/^[[:space:]]+|[[:space:]]+$/, "", val); print val; exit }
            }' "$sol/$sol_rm_file" 2>/dev/null || true)"
        fi

        if [[ $first_row_done -eq 0 ]]; then
          echo "| [Problem-$prob_num: $prob_title]($prob_link) | [${sol_title}]($sol_link) | ${time_c:-} | ${space_c:-} |" >> "$tmp_toc"
          first_row_done=1
        else
          echo "|  | [${sol_title}]($sol_link) | ${time_c:-} | ${space_c:-} |" >> "$tmp_toc"
        fi
      done

      if [[ $any_solution -eq 0 ]]; then
        echo "| [Problem-$prob_num: $prob_title]($prob_link) |  |  |  |" >> "$tmp_toc"
      fi
    done
    echo "" >> "$tmp_toc"
  done

  # Splice TOC between markers using BSD sed (macOS safe)
  local tmp_readme; tmp_readme="$(mktemp)"
  sed -e '/<!-- TOC:START -->/,/<!-- TOC:END -->/ {
    /<!-- TOC:START -->/ {
      p
      r '"$tmp_toc"'
      d
    }
    /<!-- TOC:END -->/p
    d
  }' "$ROOT_README" > "$tmp_readme"

  mv "$tmp_readme" "$ROOT_README"
  rm -f "$tmp_toc"
  echo "🧭 TOC updated in readme.md"
}


# ---------------- CLI parsing ----------------
MODE="${1-}"
shift || true

CAT_NUM=""
CAT_LABEL=""
PROB_NUM=""
PROB_TITLE=""
PROB_DIFF="Easy"
PROB_TAGS=""
PROB_ID=""
SOL_NUM=""
SOL_TITLE=""
SOL_APPROACH=""
SOL_LANG="Go"
SOL_TAGS=""
SOL_ID=""
INTERACTIVE=0

while [[ $# -gt 0 ]]; do
  case "$1" in
    --cat) CAT_NUM="$(pad2 "${2-1}")"; shift 2;;
    --label) CAT_LABEL="$(trim "${2-}")"; shift 2;;
    --prob) PROB_NUM="${2-}"; shift 2;;
    --title)
      if [[ -z "$PROB_TITLE" ]]; then PROB_TITLE="$(trim "${2-}")"; else SOL_TITLE="$(trim "${2-}")"; fi
      shift 2;;
    --difficulty) PROB_DIFF="$(trim "${2-}")"; shift 2;;
    --tags) if [[ -z "$PROB_TAGS" ]]; then PROB_TAGS="${2-}"; else SOL_TAGS="${2-}"; fi; shift 2;;
    --approach) SOL_APPROACH="$(trim "${2-}")"; shift 2;;
    --lang) SOL_LANG="$(trim "${2-}")"; shift 2;;
    --prob-id) PROB_ID="$(trim "${2-}")"; shift 2;;
    --sol) SOL_NUM="${2-}"; shift 2;;
    --sol-id) SOL_ID="$(trim "${2-}")"; shift 2;;
    --interactive|-i) INTERACTIVE=1; shift;;
    *) echo "Unknown arg: $1"; exit 1;;
  esac
done

ensure_cat_num() {
  if [[ -z "$CAT_NUM" ]]; then
    if [[ $INTERACTIVE -eq 1 ]]; then
      ask "Category number (e.g., 1 for category-01): " CAT_NUM "1"
      CAT_NUM="$(pad2 "$CAT_NUM")"
    else
      echo "Missing --cat"; exit 1
    fi
  fi
}

ensure_category_dir_or_offer_create() {
  ensure_cat_num
  local CATDIR="category-$CAT_NUM"
  if [[ -d "$CATDIR" ]]; then
    return 0
  fi
  echo "ERROR: '$CATDIR' does not exist."
  if [[ $INTERACTIVE -eq 1 ]]; then
    if ask_yn "Create '$CATDIR' now?"; then
      if [[ -z "$CAT_LABEL" ]]; then
        ask "Optional category label (e.g., Arrays & Hashing): " CAT_LABEL ""
      fi
      mkdir -p "$CATDIR"
      if [[ ! -f "$CATDIR/readme.md" ]]; then
        write_file "$CATDIR/readme.md" <<<"$(category_readme_init "$CAT_NUM" "$CAT_LABEL")"
      fi
      echo "✅ Category created: $CATDIR"
      return 0
    else
      echo "Please create the category first:"
      echo "  ./dsa.sh category --cat ${CAT_NUM#0} --label \"Your Label\" --interactive"
      exit 1
    fi
  else
    echo "Create it with:"
    echo "  ./dsa.sh category --cat ${CAT_NUM#0} --label \"Your Label\""
    exit 1
  fi
}

# ---------------- Actions ----------------

do_category() {
  ensure_cat_num
  local CATDIR="category-$CAT_NUM"
  if [[ $INTERACTIVE -eq 1 && -z "$CAT_LABEL" ]]; then
    ask "Optional category label (e.g., Arrays & Hashing): " CAT_LABEL ""
  fi
  mkdir -p "$CATDIR"
  if [[ ! -f "$CATDIR/readme.md" ]]; then
    write_file "$CATDIR/readme.md" <<<"$(category_readme_init "$CAT_NUM" "$CAT_LABEL")"
  else
    echo "  = exists: $CATDIR/readme.md"
  fi
  echo "✅ Category ready: $CATDIR"
  update_root_toc
}

do_problem() {
  ensure_cat_num
  ensure_category_dir_or_offer_create
  local CATDIR="category-$CAT_NUM"

  if [[ $INTERACTIVE -eq 1 && -z "$PROB_TITLE" ]]; then
    ask "Problem title: " PROB_TITLE ""
  fi
  [[ -n "$PROB_TITLE" ]] || { echo "Missing problem --title"; exit 1; }

  if [[ -z "$PROB_NUM" || "$PROB_NUM" == "auto" ]]; then
    PROB_NUM="$(next_problem_num "$CATDIR")"
  else
    PROB_NUM="$(pad2 "$PROB_NUM")"
  fi

  if [[ $INTERACTIVE -eq 1 && -z "$PROB_DIFF" ]]; then ask "Difficulty [Easy/Medium/Hard] (default Easy): " PROB_DIFF "Easy"; fi
  if [[ $INTERACTIVE -eq 1 && -z "$PROB_TAGS" ]]; then ask "Problem tags CSV (optional): " PROB_TAGS ""; fi
  if [[ $INTERACTIVE -eq 1 && -z "$PROB_ID" ]]; then ask "Front-matter id for Problem (blank=auto): " PROB_ID ""; fi

  local PROBDIR="$CATDIR/problem-$PROB_NUM"
  mkdir -p "$PROBDIR"

  if [[ ! -f "$CATDIR/readme.md" ]]; then
    write_file "$CATDIR/readme.md" <<<"$(category_readme_init "$CAT_NUM" "$CAT_LABEL" "$PROB_NUM" "$PROB_TITLE")"
  else
    append_unique_line "$CATDIR/readme.md" "- [Problem-$PROB_NUM](./problem-$PROB_NUM/readme.md) – $PROB_TITLE"
  fi

  if [[ -f "$PROBDIR/readme.md" ]]; then
    echo "  = exists: $PROBDIR/readme.md (unchanged)"
  else
    problem_readme_tpl "$PROB_ID" "$PROB_TITLE" "$PROB_TAGS" "$PROB_DIFF" \
      | write_file "$PROBDIR/readme.md"
  fi

  echo "✅ Problem ready: $PROBDIR"
  update_root_toc
}

do_solution() {
  ensure_cat_num
  ensure_category_dir_or_offer_create

  if [[ -z "$PROB_NUM" || "$PROB_NUM" == "auto" ]]; then
    if [[ $INTERACTIVE -eq 1 ]]; then ask "Problem number to add solution (e.g., 1 => problem-01): " PROB_NUM ""; fi
  fi
  [[ -n "$PROB_NUM" ]] || { echo "Missing --prob for solution mode"; exit 1; }
  PROB_NUM="$(pad2 "$PROB_NUM")"

  local PROBDIR="category-$CAT_NUM/problem-$PROB_NUM"
  [[ -d "$PROBDIR" ]] || { echo "ERROR: '$PROBDIR' does not exist. Create the problem first."; exit 1; }

  if [[ -z "$SOL_NUM" || "$SOL_NUM" == "auto" ]]; then
    SOL_NUM="$(next_solution_num "$PROBDIR")"
  else
    SOL_NUM="$(pad2 "$SOL_NUM")"
  fi
  local SOLDIR="$PROBDIR/solution-$SOL_NUM"

  if [[ $INTERACTIVE -eq 1 && -z "$SOL_TITLE" ]]; then ask "Solution title (e.g., Solution-$SOL_NUM: Brute Force): " SOL_TITLE "Solution-$SOL_NUM"; fi
  if [[ $INTERACTIVE -eq 1 && -z "$SOL_APPROACH" ]]; then ask "Approach type (e.g., Brute Force / Sorting): " SOL_APPROACH ""; fi
  if [[ $INTERACTIVE -eq 1 && -z "$SOL_LANG" ]]; then ask "Language [Go]: " SOL_LANG "Go"; fi
  if [[ $INTERACTIVE -eq 1 && -z "$SOL_TAGS" ]]; then ask "Solution tags CSV (optional): " SOL_TAGS ""; fi
  if [[ $INTERACTIVE -eq 1 && -z "$SOL_ID" ]]; then ask "Front-matter id for Solution (blank=auto): " SOL_ID ""; fi

  mkdir -p "$SOLDIR"

  if [[ -f "$SOLDIR/readme.md" ]]; then
    echo "  = exists: $SOLDIR/readme.md (unchanged)"
  else
    solution_readme_tpl "$SOL_ID" "$SOL_TITLE" "$SOL_APPROACH" "$SOL_LANG" "$SOL_TAGS" \
      | write_file "$SOLDIR/readme.md"
  fi

  if [[ -f "$SOLDIR/main.go" ]]; then
    echo "  = exists: $SOLDIR/main.go (unchanged)"
  else
    main_go_tpl | write_file "$SOLDIR/main.go"
  fi

  local CATDIR="category-$CAT_NUM"
  if [[ -f "$CATDIR/readme.md" ]]; then
    local title_line
    title_line="$(sed -n 's/^title:[[:space:]]*"\(.*\)".*$/\1/p' "$PROBDIR/readme.md" | head -n1 || true)"
    append_unique_line "$CATDIR/readme.md" "- [Problem-$PROB_NUM](./problem-$PROB_NUM/readme.md) – ${title_line:-Problem-$PROB_NUM}"
  fi

  echo "✅ Solution ready: $SOLDIR"
  update_root_toc
}

# ---------------- Dispatch ----------------

MODE="${MODE:-}"
case "$MODE" in
  category) do_category ;;
  problem)  do_problem ;;
  solution) do_solution ;;
  ""|help|-h|--help)
    cat <<'EOF'
Usage:
  dsa.sh category --cat 1 [--label "Arrays & Hashing"] [--interactive]
  dsa.sh problem  --cat 1 [--prob auto|N] --title "Problem Title" \
                  [--difficulty Easy|Medium|Hard] [--tags "a,b"] [--prob-id ID] [--interactive]
  dsa.sh solution --cat 1 --prob N [--sol auto|N] \
                  --title "Solution-01: Brute Force" --approach "Brute Force" \
                  [--lang Go] [--tags "a,b"] [--sol-id ID] [--interactive]

TOC:
- The script maintains a generated TOC in the root readme.md between:
    <!-- TOC:START -->
    <!-- TOC:END -->

Notes:
- macOS-safe (Bash 3.2). No external deps.
- If solution/problem readme uses "readme.go" instead of "readme.md", links still work.

Examples:
  ./dsa.sh category --cat 1 --label "Arrays & Hashing"
  ./dsa.sh problem  --cat 1 --prob auto --title "Contains Duplicate" --difficulty Easy --tags "Arrays,Hashing"
  ./dsa.sh solution --cat 1 --prob 1 --sol auto --title "Solution-02: Sorting" --approach "Sorting" --tags "Sorting,Array"

Interactive:
  ./dsa.sh category --interactive
  ./dsa.sh problem  --interactive
  ./dsa.sh solution --interactive
EOF
    ;;
  *) echo "Unknown mode: $MODE"; exit 1;;
esac
