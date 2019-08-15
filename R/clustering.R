# Making sure small groups are assigned any large group
# Weigthed cluster analysis

# some testdata
x <- c(1,3,6,15)
y <- c(0.5,0.5,7,15)
weights <- as.character(c(80, 75,100, 5))

# plot
plot(1, type="n", xlim=c(0,20), ylim=c(0,20))
text(x, y, weights)

# make 3 clusters
weighted <- weights *

kmeans()
