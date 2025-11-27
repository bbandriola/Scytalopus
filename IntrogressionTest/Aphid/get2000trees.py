#Script lê arquivos com 1 item por linha
#Cada linha é adicionada a uma lista com todas as topologias
#A lista de topologias é lida a cada 5 itens que são salvas no arquivo de saida

Input= open("allrootedtrees.txt",'r')
output = open("2000_rootedtrees.txt" ,'w')
trees = Input.readlines()
trees_list =[]
contador = 0
for linha in trees:
	trees_list.append(linha)
topologies = []
while contador < len(trees_list):
	topologies.append(trees_list[contador])
	contador = contador + 8

output.writelines(topologies)
output.close()
