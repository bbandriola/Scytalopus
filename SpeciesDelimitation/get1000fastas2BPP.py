#Script lê arquivos com 1 item por linha
#Cada linha é adicionada a uma lista com todas as topologias
#A lista de topologias é lida a cada 5 itens que são salvas no arquivo de saida

Input= open("5kbfastastobeused.txt",'r')
output = open("1000_windows.txt" ,'w')
trees = Input.readlines()
trees_list =[]
contador = 0
for linha in trees:
	trees_list.append(linha)
topologies = []
while contador < len(trees_list):
	topologies.append(trees_list[contador])
	contador = contador + 10

output.writelines(topologies)
output.close()
