mkdir -p PhyNEST

for file in edited*; do
  out="PhyNEST/PhynestAnalysis_${file#edited}"
  awk '
    /^>Sdiamantinensis127win1kb$/ {skip=1; next}
    /^>Spachecoi154win1kb$/ {skip=1; next}
    /^>Sspeluncae101$/ {skip=1; next}
    /^>Sspeluncae103$/ {skip=1; next}
    /^>Sspeluncae106$/ {skip=1; next}
    /^>Sspeluncae107$/ {skip=1; next}
    /^>Sspeluncae109$/ {skip=1; next}
    /^>Sspeluncae110$/ {skip=1; next}
    /^>Sspeluncae114$/ {skip=1; next}
    /^>Sspeluncae117$/ {skip=1; next}
    /^>Sspeluncae118$/ {skip=1; next}
    /^>Sspeluncae119$/ {skip=1; next}
    /^>Sspeluncae121$/ {skip=1; next}
    /^>Sspeluncae122$/ {skip=1; next}
    /^>Sspeluncae139$/ {skip=1; next}
    /^>Sspeluncae13$/ {skip=1; next}
    /^>Sspeluncae14$/ {skip=1; next}
    /^>Sspeluncae15$/ {skip=1; next}
    /^>Sspeluncae23$/ {skip=1; next}
    /^>Sspeluncae28$/ {skip=1; next}
    /^>Sspeluncae30$/ {skip=1; next}
    /^>Sspeluncae32$/ {skip=1; next}
    /^>Spetrophilus$/ {skip=1; next}
    /^>Sspeluncae38$/ {skip=1; next}
    /^>Sspeluncae43$/ {skip=1; next}
    /^>Sspeluncae46$/ {skip=1; next}
    /^>Sspeluncae47$/ {skip=1; next}
    /^>Sspeluncae48$/ {skip=1; next}
    /^>Sspeluncae4$/ {skip=1; next}
    /^>Sspeluncae56$/ {skip=1; next}
    /^>Sspeluncae5$/ {skip=1; next}
    /^>Sspeluncae68$/ {skip=1; next}
    /^>Sspeluncae69$/ {skip=1; next}
    /^>Sspeluncae71$/ {skip=1; next}
    /^>Sspeluncae74$/ {skip=1; next}
    /^>Sspeluncae75$/ {skip=1; next}
    /^>Sspeluncae85$/ {skip=1; next}
    /^>Sspeluncae86$/ {skip=1; next}
    /^>Sspeluncae95$/ {skip=1; next}
    /^>Sspeluncae9$/ {skip=1; next}
    /^>Ssuperciliariswin1kb$/ {skip=1; next}
    /^>/ && skip {skip=0}  # stop skipping at next header
    !skip
  ' "$file" > "$out"
done
