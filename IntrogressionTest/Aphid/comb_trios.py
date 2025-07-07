from itertools import combinations

# Lista de suas 6 espécies
especies = ["Lin1", "Lin2", "Lin3", "Lin4", "Lin5", "Lin67","Lin7"]

# Gerar todas as combinações possíveis de trios
comb_trios = list(combinations(especies, 3))

# Imprimir todas as combinações de trios
for trio in comb_trios:
    # Usar codificação Unicode para lidar com caracteres não ASCII
    print(", ".join(trio).encode('utf-8').decode('utf-8'))
