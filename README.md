# R_code_WAchat

This code allows you to analyis the data of messages sent to a WhatsApp chat.

## Download chat data
On your WhatsApp mobile App you can click on the group information. If you scroll to the end of the page you will find "Export chat". Select this option to download the data.

## The code
You simple need to change the document name and file path of your chat data.
Afterwards you can run the code and get a plot as output.

Because this was a rather larger group, I decided to only analyis the top 25 people in terms of messages sent. 
You can easily change that by updating the first ggplot line with the following: 

- ggplot(data = analysis, aes(author,n)) +

Thanks and have fun with this project!
