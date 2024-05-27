library(ggplot2)


mydata <- read.csv('https://web.stanford.edu/class/archive/cs/cs109/cs109.1166/stuff/titanic.csv')
head(mydata)

sum(is.na(mydata))
summary(mydata)
str(mydata)

mydata$Survived <- factor(mydata$Survived)
mydata$Pclass <- factor(mydata$Pclass)
mydata$Sex <- factor(mydata$Sex)

#Rozkład według klasy
viz_pass_dist_p_class <- ggplot(data=mydata, aes(x=Pclass)) + geom_bar(color='Black') +
  ggtitle('Rozkład pasażerów wg klasy') +
  xlab('Klasa') + ylab('Ilość pasażerów') +
  theme(plot.title=element_text(size=20, hjust=0.5))
viz_pass_dist_p_class

#Rozkład według płci
viz_pass_dist_p_sex <- ggplot(data=mydata, aes(x=Sex)) + geom_bar(color='Black') +
  ggtitle('Rozkład pasażerów wg płci') +
  xlab('Płeć pasażerów') + ylab('Ilość pasażerów') +
  theme(plot.title=element_text(size=20, hjust=0.5)) +
  scale_x_discrete(labels=c('female'='Kobiety', 'male'='Mężczyźni'))
viz_pass_dist_p_sex

#Rozkład według wieku
viz_pass_dist_p_age <- ggplot(data=mydata, aes(x=Age)) + geom_histogram(color='Black') +
  ggtitle('Rozkład pasażerów wg wieku') +
  xlab('Wiek pasażerów') + ylab('Ilość pasażerów') +
  theme(plot.title=element_text(size=20, hjust=0.5))
viz_pass_dist_p_age

#Przeżywalność, a klasa pasażerów
sur_viz_pass_dist_p_class <- ggplot(data=mydata, aes(x=Pclass, fill=Survived)) + geom_bar(color='Black') +
  ggtitle('Przeżywalość wg klasy') +
  xlab('Klasa') + ylab('Ilość pasażerów') +
  scale_fill_discrete(name = 'Przeżył', labels = c('Nie', 'Tak')) +
  theme(plot.title=element_text(size=20, hjust=0.5))
sur_viz_pass_dist_p_class

#Przeżywalność, a płeć
sur_viz_pass_dist_p_sex <- ggplot(data=mydata, aes(x=Sex, fill=Survived)) + geom_bar(color='Black') +
  ggtitle('Przeżywalość wg płci') +
  xlab('Płeć') + ylab('Ilość pasażerów') +
  scale_fill_discrete(name = 'Przeżył', labels = c('Nie', 'Tak')) +
  theme(plot.title=element_text(size=20, hjust=0.5)) +
  scale_x_discrete(labels=c('female'='Kobiety', 'male'='Mężczyźni'))
sur_viz_pass_dist_p_sex

#Przeżywalność, a wiek
sur_viz_pass_dist_p_age <- ggplot(data=mydata, aes(x=Age, fill=Survived)) + geom_histogram(color='Black') +
  ggtitle('Przeżywalość wg wieku') +
  xlab('Wiek') + ylab('Ilość pasażerów') +
  scale_fill_discrete(name='Przeżył', labels=c('Nie', 'Tak')) +
  theme(plot.title=element_text(size=20, hjust=0.5))
sur_viz_pass_dist_p_age

#Przeżywalność wg klasy, wieku i płci
sur_viz_pass_dist_all <- ggplot(data=mydata, aes(x=Age, fill=Survived)) + geom_histogram(color='Black', size=0.3) +
  facet_grid(Sex~Pclass, scales='free', labeller=labeller(
        Sex=c('female'='Kobiety', 'male'='Mężczyźni'),
        Pclass=c('1'='1 klasa', '2'='2 klasa', '3'='3 klasa'))) +
  xlab('Wiek') + ylab('Ilość pasażerów') +
  ggtitle('Przeżywalość wg wieku, płci i klasy') +
  theme(plot.title=element_text(size=20, hjust=0.5)) +
  scale_fill_discrete(name='Przeżył', labels=c('Nie', 'Tak'))
sur_viz_pass_dist_all
