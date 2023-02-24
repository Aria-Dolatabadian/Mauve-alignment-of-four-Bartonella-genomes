bbone_file <- system.file('extdata/barto.backbone', package = 'genoPlotR')
bbone <- read_mauve_backbone(bbone_file, ref=2, filter_low=10000)
names <- c("B_bacilliformis", "B_grahamii", "B_henselae", "B_quintana")
names(bbone$dna_segs) <- names


for (i in 1:length(bbone$comparisons)){
   cmp <- bbone$comparisons[[i]]
   bbone$comparisons[[i]]$length <- 
     abs(cmp$end1 - cmp$start1) + abs(cmp$end2 - cmp$start2)
 }


plot_gene_map(dna_segs=bbone$dna_segs, 
               comparisons=bbone$comparisons,
               global_color_scheme=c("length", "increasing", "red_blue", 0.7),
               override_color_schemes=TRUE)
