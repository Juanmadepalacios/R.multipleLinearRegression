#Progresi�n Lineal Simple

#Importar el dataset
dataset = read.csv('Salary_Data.csv')
#dataset = dataset[, 2:3]

#Dividir los datos en conjunto de entrenamiento y conjunto de test
#install.packages("caTools")
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
testing_set = subset(dataset, split == FALSE)

#Escalado de valores
# training_set[,2:3] = scale(training_set[,2:3])
# testing_set[,2:3] = scale(testing_set[,2:3])

#Ajustar el modelo de regresi�n lineal siemple con el conjunto de entrenamiento
regressor = lm(formula = Salary ~ YearsExperience,
               data = training_set)

#Predecir resultados con el conjunto de test
y_pred = predict(regressor, newdata = testing_set)

#Visualizaci�n de ls resultados en el conjunto de entrenamiento 
#install.packages("ggplot2")
library(ggplot2)
ggplot() + 
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary),
             colour = "red") + 
  geom_line(aes(x = training_set$YearsExperience, 
                y = predict(regressor, newdata = training_set)),
            colour = "blue") +
  ggtitle("Sueldo vs A�os de Experiencia (Conjunto de Entrenamiento)") + 
  xlab("A�os de experiencia") +
  ylab("Sueldo (en $)")

#Vizualici�n de los resultados en el conjunto de testing
ggplot() + 
  geom_point(aes(x = testing_set$YearsExperience, y = testing_set$Salary),
             colour = "red") + 
  geom_line(aes(x = training_set$YearsExperience, 
                y = predict(regressor, newdata = training_set)),
            colour = "blue") +
  ggtitle("Sueldo vs A�os de Experiencia (Conjunto de Testing)") + 
  xlab("A�os de experiencia") +
  ylab("Sueldo (en $)")