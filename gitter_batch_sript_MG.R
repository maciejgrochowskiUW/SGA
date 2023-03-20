setwd("~/mojaanalizaSGA")
require(gitter)

gitter.batch(image.files = "1_Batch/20190627_CID1_c2/", verbose = 'p', inverse = TRUE, plate.format = 384,
             grid.save = "1_Batch/20190627_CID1_c2/",
             dat.save = "1_Batch/20190627_CID1_c2/")
gitter.batch(image.files = "1_Batch/20190627_DIS32_c2/", verbose = 'p', inverse = TRUE, plate.format = 384,
             grid.save = "1_Batch/20190627_DIS32_c2/",
             dat.save = "1_Batch/20190627_DIS32_c2/")
gitter.batch(image.files = "1_Batch/20190627_CID16_c2/", verbose = 'p', inverse = TRUE, plate.format = 384,
             grid.save = "1_Batch/20190627_CID16_c2/",
             dat.save = "1_Batch/20190627_CID16_c2/")
gitter.batch(image.files = "1_Batch/20190627_LEU1_c2/", verbose = 'p', inverse = TRUE, plate.format = 384,
             grid.save = "1_Batch/20190627_LEU1_c2/",
             dat.save = "1_Batch/20190627_LEU1_c2/")


gitter.batch(image.files = "2_Batch/20190628_CID1_c2/", verbose = 'p', inverse = TRUE, plate.format = 384,
             grid.save = "2_Batch/20190628_CID1_c2/",
             dat.save = "2_Batch/20190628_CID1_c2/")
gitter.batch(image.files = "2_Batch/20190628_CID16_c2/", verbose = 'p', inverse = TRUE, plate.format = 384,
             grid.save = "2_Batch/20190628_CID16_c2/",
             dat.save = "2_Batch/20190628_CID16_c2/")
gitter.batch(image.files = "2_Batch/20190628_DIS32_c2/", verbose = 'p', inverse = TRUE, plate.format = 384,
             grid.save = "2_Batch/20190628_DIS32_c2/",
             dat.save = "2_Batch/20190628_DIS32_c2/")
gitter.batch(image.files = "2_Batch/20190628_LEU1_c2/", verbose = 'p', inverse = TRUE, plate.format = 384,
             grid.save = "2_Batch/20190628_LEU1_c2/",
             dat.save = "2_Batch/20190628_LEU1_c2/")




# for the files that did not work I can use the reference that was taken in the same scanner position
gitter.batch(image.files = "EMM_Ant_rep2/EMM_Ant_8_rep2.jpg", verbose = 'p', inverse = TRUE, plate.format = 384,
             ref.image.file = "EMM_Ant_rep1/EMM_Ant_8_rep1.jpg")


