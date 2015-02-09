library(shiny)
url <- "https://kickass.so/hourlydump.txt.gz"
download.file(url, "./hourlydump.txt.gz", method="wget")
tbl <- read.table(gzfile('hourlydump.txt.gz'), header=FALSE,
                  sep='|', fill=T, comment.char="", quote="",
                  col.names = c("hash", "title", "category", "url", "torrent"))
tt <- table(tbl$category)
labels <- paste(names(tt))

shinyServer(function(input, output, session) {

  output$distPlot <- renderPlot({
    t <- barplot(tt, xaxt="n", ylim=c(0,300+max(tt)), space=1, las=2,
                 col=rainbow(input$colors), ylab="Number of Torrents",
                 xlab="Categories", main="Kickass...")
    axis(2,at=seq(0,1000+max(tt),500), cex=.85, las=2)
    text(t, labels=labels, par("usr")[3], cex=1.2, srt=45, xpd=TRUE, adj=c(1.1,1.1))
  })
})