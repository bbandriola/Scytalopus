library(ggplot2)

# Create the data
df <- data.frame(
  Group = c(
    rep("Lin2(P1) x South(P2)", 16),
    rep("South(P1) x Lin2(P2)", 16)
  ),
  
  Gamma = c(
    # Gamma values for P1 = Lin2
    0.152761494,0.156704774,0.153068297,0.15194534,0.105980367,0.108917157,0.106341165,0.101638143,0.161419338,0.165635749,0.161717655,0.160805383,0.144649023,0.148638063,0.145039033,0.143430773,   
    # Gamma values for P2 = Lin2
    0.847238506,0.843295226,0.846931703,0.84805466,0.894019633,0.891082843,0.893658835,0.898361857,0.838580662,0.834364251,0.838282345,0.839194617,0.855350977,0.851361937,0.854960967,0.856569227
  )
)


# Look at the data
print(df)

p <- ggplot(df, aes(x = Group, y = Gamma)) +
  geom_violin(trim = FALSE,fill = "#7570B3", alpha = 0.5) +
  geom_jitter(width = 0.05,size = 1.5, alpha = 0.9, color = "#7570B3") +
  stat_summary(
    fun = mean,
    fun.min = function(x) mean(x) - sd(x),
    fun.max = function(x) mean(x) + sd(x),
    geom = "pointrange"
  )+
  #scale_y_continuous(breaks = seq(0, 1, by = 0.15)) +
  scale_y_continuous(breaks = scales::breaks_extended(n = 5))+
  theme_minimal(base_size = 10,base_family = "Arial") +
  theme(axis.title = element_text(size = 10),
    axis.title.x = element_text(size =10),  
    axis.title.y = element_text(size =15))+
  labs(
    x = "",
    y = "Gamma")

ggsave("HyDe.svg", plot = p, width = 6, height = 6)
