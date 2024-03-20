install.packages("rwhatsapp")
install.packages("stopwords")
install.packages("tidytext")
library(tidytext)
library(stopwords)
library(rwhatsapp)
library(dplyr)
library(ggplot2)

chat <- rwa_read("Read_in_your_File/_chat.txt") %>%
  filter(!is.na(author)) %>%
  mutate(count_character= nchar(text), 
         words= nchar(gsub('[^ ]+', '',text))+1)

#similar to chat but we are not removing the entries where author is null
#plain_chat<-rwa_read("name_of_whatsapp_file.txt") %>% mutate(count_character= nchar(text), words= nchar(gsub('[^ ]+', '',text))+1)

analysis <- count(chat, author)

analysis <- analysis %>% 
  arrange(desc(n)) 
analysis1_25 <- analysis[1:25,]
positions <- c(analysis1_25$author)
 
ggplot(data = analysis1_25, aes(author,n)) +
  geom_bar(stat="identity", width=.5, fill="tomato3") +
  theme(axis.text.x = element_text(angle=65, vjust=0.6)) +
  scale_x_discrete(limits = positions) + 
  labs(title = "Who is dominating our WhatsApp group chat", subtitle = "An analysis done in R. For research purposes only!") + 
  xlab("Author") + 
  ylab("Number of Messages")

