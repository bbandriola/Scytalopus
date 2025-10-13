#!/usr/bin/env python3
import allel
import sys

# IUPAC ambiguity codes for heterozygotes
IUPAC_CODES = {
    frozenset(["A", "G"]): "R",
    frozenset(["C", "T"]): "Y",
    frozenset(["G", "C"]): "S",
    frozenset(["A", "T"]): "W",
    frozenset(["G", "T"]): "K",
    frozenset(["A", "C"]): "M"
}

def get_iupac(base1, base2):
    """Return IUPAC ambiguity code for heterozygous bases."""
    if base1 == base2:
        return base1
    return IUPAC_CODES.get(frozenset([base1, base2]), "N")

def vcf_to_phylip(vcf_path, output_path):
    callset = allel.read_vcf(vcf_path)
    samples = callset['samples']
    genotypes = allel.GenotypeArray(callset['calldata/GT'])
    num_ind = len(samples)
    num_sites = genotypes.shape[0]

    print(f"Loaded {num_sites} SNPs for {num_ind} individuals")

    ref_alleles = callset['variants/REF']
    alt_alleles = callset['variants/ALT']

    seqs = []
    for i, sample in enumerate(samples):
        seq = []
        for j in range(num_sites):
            gt = genotypes[j, i]
            if -1 in gt:  # missing
                seq.append("N")
                continue
            alleles = []
            for allele_index in gt:
                if allele_index == 0:
                    alleles.append(ref_alleles[j])
                elif allele_index > 0 and allele_index <= len(alt_alleles[j]) and alt_alleles[j][allele_index - 1] is not None:
                    alleles.append(alt_alleles[j][allele_index - 1])
                else:
                    alleles.append("N")
            seq.append(get_iupac(alleles[0], alleles[1]))
        seqs.append("".join(seq))

    with open(output_path, "w") as f:
        f.write(f"{num_ind} {num_sites}\n")
        for i in range(num_ind):
            f.write(f"{samples[i]}\t{seqs[i]}\n")

    print(f"PHYLIP file written to {output_path}")

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python vcf_to_phylip_iupac.py input.vcf output.phy")
        sys.exit(1)
    vcf_to_phylip(sys.argv[1], sys.argv[2])
