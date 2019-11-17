install.packages('igraphdata')
install.packages('igraph')
library(igraph)
library(igraphdata)
data(package="igraphdata")
data(karate)
str(karate)
summary(karate)
V(karate) #labels of vertices
E(karate) #description of edges

gorder(karate) #number of vertices in network
gsize(karate)  #number of edges in network

vertex_attr(karate) #name of attribute on vertices
edge_attr(karate) #name of attribute on edge

#Exploratory Data Analysis
x<-neighbors(karate, "Mr Hi", mode=c("all"))
y<-neighbors(karate, "John A", mode=c("all"))
intersection(x,y)

is.directed(karate) #returns boolean value to if the dataset is directed or not
head(ego(karate,order=2,"Mr Hi", mode="all")) #finds nodes that are within two steps of Mr Hi

get_diameter(karate)
farthest_vertices(karate)


which.max(degree(karate,mode=c("all"))) #person with the most connections


#Plotting
set.seed(47) #random number generators useful for creating simulations
plot.igraph(karate,vertex.label.color="blue",
            edge.color='red',
            vertex.size=11,
            color=c(1,2,3),
            vertex.label.cex=.6,
            vertex.label.degree=-pi/2,
            layout=layout_with_lgl(karate),
            edge.width=0.6*E(karate)$weight,
            main="Karate Network",
            sub=paste("Number of vertices",gorder(karate),"\n","Number of Edges",gsize(karate)))


#Degree Centrality
degree.cent <- centr_degree(karate, mode = "all")
degree.cent

#Closeness Centrality
cc<-closeness(karate, mode="all")
cc

#Betweeness Centrality
bc<-betweenness(karate)
bc

#Clustering Coefficient
transitivity(karate)
transitivity(karate, type="local")
transitivity(karate, type="average")

