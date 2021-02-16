#!/usr/bin/env bash
escape() {
  sed 's/[^^]/[&]/g; s/\^/\\^/g' <<<"$1";
}
export -f escape
escapeReplace() {
  sed 's/[&/\]/\\&/g' <<<"$1";
}
export -f escapeReplace
searchfile() {
  LINKS=$(grep -oP '(?<=\]\().+?(?=[\)| ])' "$1")
  for link in $LINKS; do
    if echo $link | grep -E '^http' >/dev/null; then
      continue
    fi
    if [ $(find . -name "$link"".md" 2>/dev/null | wc -l) -gt 0 ]; then
      continue
    fi
    if echo "$link" | grep "#" >/dev/null; then
      continue
    fi
    if echo "$link" | grep -Ev ".md$" >/dev/null; then
      if ls "$link" 2>/dev/null >/dev/null; then
        continue
      else
        echo $link
        FILES=$(find . -iname "*$(basename $link)*")
        echo "$FILES" | cat --number
        read PICK
        FILE=$(echo "$FILES" | head -n $PICK | tail -n 1)
        REPLACE=$(escape '('$link')')
        REPLACEWITH=$(escapeReplace "$FILE")
        sed -i "s/$REPLACE/\($REPLACEWITH\)/" "$1"
        continue
      fi
    fi
    echo $link
    FILES=$(find . -iname "*$(basename $link)*")
    echo "$FILES" | cat --number
    read PICK
    FILE=$(basename "$(echo "$FILES" | head -n $PICK | tail -n 1)" .md)
    REPLACE=$(escape '('$link')')
    REPLACEWITH=$(escapeReplace "$FILE")
    sed -i "s/$REPLACE/\($REPLACEWITH\)/" "$1"
  done
}
export -f searchfile
find . -iname "*.md" -exec bash -c 'searchfile "$0"' {} \;
