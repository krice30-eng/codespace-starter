library(tidyverse)

set.seed(1)
diamonds_sample <- diamonds %>%
	slice_sample(n = 50000)

hist_p <- ggplot(diamonds_sample, aes(x = carat)) +
	geom_histogram(
		binwidth = 0.05,
		boundary = 0,
		fill = "#595959",
		color = "white"
	) +
	scale_x_continuous(breaks = 0:5, limits = c(0, 5.25)) +
	scale_y_continuous(labels = scales::comma) +
	labs(
		title = "Number of Diamonds by Carat (Weight)",
		subtitle = "Carats just at or above meaningful numbers are very common",
		x = "Carat",
		y = "Number",
		caption = "diamonds dataset from ggplot2 package"
	)

ggsave(plot = hist_p, file = "diamonds.png")
