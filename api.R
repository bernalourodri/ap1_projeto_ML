library(plumber)

# Carregar os modelos previamente treinados
modelo_regressao_linear <- readRDS("modelo_regressao_linear.rds")
modelo_regressao_logistica <- readRDS("modelo_regressao_logistica.rds")

#* @apiTitle API de Predição e Classificação

#* Predição com modelo de regressão linear
#* 
#* @get /predicao
function(workout_frequency_days_week) {
  workout_frequency_days_week <- as.numeric(workout_frequency_days_week)
  predicao <- predict(modelo_regressao_linear, newdata = data.frame(workout_frequency_days_week = workout_frequency_days_week))
  list(predicao = predicao)
}

#* Classificação com modelo de regressão logística
#* 
#* @get /classificacao
function(height_m) {
  height_m <- as.numeric(height_m)
  probabilidade <- predict(modelo_regressao_logistica, newdata = data.frame(height_m = height_m), type = "response")
  classe <- ifelse(probabilidade > 0.5, 1, 0)
  list(classe = classe, probabilidade = probabilidade)
}
