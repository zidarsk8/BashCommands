RENAMING FILES:
#renames prefix foo* with bar* (but must have .extension)
for file in foo.*; do mv {${file%%.*},bar}.${file#*.} ; done
