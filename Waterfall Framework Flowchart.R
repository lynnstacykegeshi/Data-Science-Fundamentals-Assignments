library(ggplot2)

# Data for the flowchart nodes
nodes <- data.frame(
  step = c("Initiation", "Planning", "Execution", "Monitoring", "Closing"),
  x = c(1, 2, 3, 4, 5), # Spread nodes evenly on the x-axis
  y = c(1, 1, 1, 1, 1)  # Keep all nodes on the same y-axis
)

# Edges (connections between nodes)
edges <- data.frame(
  x_start = c(1, 2, 3, 4),  # Starting points for arrows
  x_end = c(1.78, 2.76, 3.74, 4.8),    # Ending points for arrows
  y_start = c(1, 1, 1, 1),  #  Same y-coordinates for horizontal arrows
  y_end = c(1, 1, 1, 1)
)

# Create and display the flowchart
flowchart <- ggplot() +
  geom_segment(data = edges, aes(x = x_start, xend = x_end, y = y_start, yend = y_end),
               arrow = arrow(length = unit(0.2, "cm")), color = "black") +
  geom_label(data = nodes, aes(x = x, y = y, label = step),
             fill = "lightblue", color = "black", size = 5) +
  theme_void() +
  ggtitle("Waterfall Framework Phases") +
  theme(plot.title = element_text(hjust = 0.5, size = 16, face = "bold", colour = "navy", margin = margin(b = 20)),
        panel.background = element_rect(fill = "white")
      )

# View the flowchart
print(flowchart)

# Optionally save the flowchart
ggsave("flowchart.png", plot = flowchart, width = 10, height = 2)
