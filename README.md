O dataset está nomeado como df.csv. É preciso manter esse nome, pois é assim que ele é chamado no código.
Para inicializar a API, com o plumber e o swagger no modo debug, utilize os seguintes comandos:

library(plumber)

# Cria o objeto plumber
pr <- plumb("api.R")

# Roda com mensagens detalhadas no console
pr$run(port = 8000, swagger = TRUE)

Toda a documentação da API, já está contida no próprio Swagger. 
