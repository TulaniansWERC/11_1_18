#TURF ggplot workshop 
#Nov 1, 2018

#by Steve Formel

#We're going to use slackr instead of a projector this time!

library(slackr)

# dev_slackr	Send the graphics contents of the current device to a Slack...
# ggslackr	Post a ggplot to a Slack channel
# save_slackr	Save R objects to an RData file on Slack
# slackr	Output R expressions to a Slack channel/user
# slackr_bot	Send result of R expressions to a Slack channel via webhook...
# slackr_channels	Get a data frame of Slack channels
# slackr_chtrans	Translate vector of channel names to channel ID's for API
# slackr_groups	Get a data frame of Slack groups
# slackr_ims	Get a data frame of Slack IM ids
# slackr_msg	Output R expressions to a Slack channel/user
# slackr-package	slackr-package
# slackr_setup	Setup environment variables for Slack API access
# slackr_upload	Send a file to Slack
# slackr_users	Get a data frame of Slack users
# text_slackr	Sends basic text to a slack channel. Calls the...

slackr_setup(username = "willi", api_token = "xoxp-464147944704-465561497989-469910342210-8483de772e6b29fd3c7e0188c09df28e", channel = "#ggplotworkshop", incoming_webhook_url = "https://hooks.slack.com/services/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")

#On with the code, going on with the code, come on baby, no, no, no...  (anyone know this reference?)

library(ggplot2)

df <- iris

#slackr(head(df))

#An example of how ggplot can be frustrating

#ggplot is looking for a variable named "blue"
ggplot(data = iris,
       aes(x = Petal.Length, 
           y = Petal.Width, 
           color = "blue")) +
  geom_point()

#geom_point doesn't inherit [color = "blue"] because it only inherits aesthetics, not arguments
ggplot(data = iris,
       aes(x = Petal.Length, 
           y = Petal.Width), 
           color = "blue") +
  geom_point()

#geom_point makes the points blue, because it is called as an argument, not an aesthetic
ggplot(data = iris,
       aes(x = Petal.Length, 
           y = Petal.Width)) +
  geom_point(color = "blue")

#send to slackr
#dev_slackr()

#What other elements can we add?

ggplot(data = iris,
       aes(x = Petal.Length, 
           y = Petal.Width)) +
  geom_point(color = "blue") +
  theme_bw()
  
ggplot(data = iris,
       aes(x = Petal.Length, 
           y = Petal.Width)) +
  geom_point(color = "blue") +
  theme_bw() +
  facet_grid(~ Species)

ggplot(data = iris,
       aes(x = Petal.Length, 
           y = Petal.Width)) +
  geom_point(color = "blue") +
  theme_bw(base_size = 14) +
  facet_grid(~ Species)

#Change point size
ggplot(data = iris,
       aes(x = Petal.Length, 
           y = Petal.Width)) +
  geom_point(color = "blue", size = 4) +
  theme_bw(base_size = 14) +
  facet_grid(~ Species)

#change point shape
ggplot(data = iris,
       aes(x = Petal.Length, 
           y = Petal.Width)) +
  geom_point(color = "blue", size = 4, shape = 24) +
  theme_bw(base_size = 14) +
  facet_grid(~ Species)

#fill in shape
ggplot(data = iris,
       aes(x = Petal.Length, 
           y = Petal.Width)) +
  geom_point(color = "blue", size = 4, shape = 24, fill = "red") +
  theme_bw(base_size = 14) +
  facet_grid(~ Species)

#add a title?
ggplot(data = iris,
       aes(x = Petal.Length, 
           y = Petal.Width)) +
  geom_point(color = "blue", size = 4, shape = 24, fill = "red") +
  theme_bw(base_size = 14) +
  theme(plot.title = element_text(hjust = 0.5)) +
  facet_grid(~ Species) +
  ggtitle("Iris petal sizes")

#What if we use shape or color to separate species instead of facets?


#Do this as a group----

#shape and color by species
ggplot(data = iris,
       aes(x = Petal.Length, 
           y = Petal.Width)) +
  geom_point(color = "blue", size = 4, shape = 24, fill = "red") +
  theme_bw(base_size = 14) +
  facet_grid(~ Species)

ggplot(data = iris,
       aes(x = Petal.Length, 
           y = Petal.Width)) +
  geom_point(aes(color = Species)) +
  theme_bw(base_size = 14) 

slackr(ggplot(data = iris,
       aes(x = Petal.Length, 
           y = Petal.Width)) +
  geom_point(aes(shape = Species, color = Species)) +
  scale_color_manual(values=c("red","royalblue","darkgreen"), labels=c("A","b","C"))+
  scale_shape_manual(values=c(4,25,1))+
  theme_bw(base_size = 14)) 


#Now let's move to slack and work on our own data!
