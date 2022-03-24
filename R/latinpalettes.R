# Reggaeton Albums Color Palette Package
#
# This is a color palette based on album covers from a selection of latin singers.
#
# You can learn more about package authoring with RStudio at:
#
#
#
#   Install Package:           'Ctrl + Shift + B'



# 1.Create the color palettes
#::::::::::::::::::::::::::::::::::::::::::::::
#' Complete list of palettes
#'
#' Use \code{names(latin_palettes)} to view list of palette names.
#' Currently:  aventura, badbunny1, badbunny2, badgyal, beckyg, calle13, daddy1, daddy2,
#' don, ivyqueen, karolg, natti, nicky, ozuna, planb, rosalia, shakira, wyy.
#'
#' @export

latin_palettes=list(aventura=c("#284C46","#B3B177","#E18964","#192E27","#A8B4A3","#AE5D40","#38190A","#4E6253","#000000"),
                    badbunny1=c("#0D6BA6","#A9D1E9","#FD9247","#6C4191","#0B92B4","#8B4E66","#9E2F2E","#2E3E99","#615911"),
                    badbunny2=c("#181234","#B93021","#F8B45E","#E85433","#698AB5","#E4BB3C","#552328","#22446A","#EB8259"),
                    badgyal=c("#0C2AE0","#6C41D3","#D6B784","#020202","#A091DC","#403EE2","#D895AE","#957881","#ABD2EE"),
                    beckyg=c("#381814","#cf0000","#FCBB8C","#86220F","#E56427","#FA9354","#d47170","#8D8D8D","#090404"),
                    calle13=c("#DD4F5E","#A5C360","#F7E693","#E48A9C","#3F9250","#E2995E","#5FBDE6","#342B65","#71403E"),
                    daddy1=c("#ab1314","#E47368","#E1E0D9","#59493A","#E24445","#BD916E","#262016","#BAB2A2","#8C7A67"),
                    daddy2=c("#1B0100","#835809","#FCC838","#655A24","#FCF45C","#B88D15","#FFFD9E","#4A2003","#B29721"),
                    don=c("#000000","#BB7A55","#F3CEA4","#451F15","#993D1A","#664D41","#3b2c25","#D09283","#D1A079"),
                    ivyqueen=c("#3F0E2C","#EC1A7F","#FEA56C","#111029","#7A266A","#DF1A3B","#992160","#A45D6B","#EA5B61"),
                    karolg=c("#18B587","#99CCD9","#ff0069","#202B2A","#2AC0E7","#24576F","#6E422C","#F0926F","#E59EC0"),
                    natti=c("#72069A","#FD833F","#E01215","#4A0E6B","#F509D3","#bd0c66","#8E1423","#EE2254","#CA513D"),
                    nicky=c("#336B66","#BE7E57","#563A22","#773824","#5D7A77","#7D5234","#27271A","#4A5A51","#A68F7A"),
                    ozuna=c("#7E0734","#04AAB3","#0F3645","#603A79","#A0405D","#246B82","#B3B4AF","#F5F561","#4B1E3D"),
                    planb=c("#244672","#24BBCF","#8b0024","#A91766","#A6D5DE","#416D97","#D06DA8","#B39E9D","#261024"),
                    rosalia=c("#8092B0","#EACF9E","#fadc16","#4f607D","#BCC7D2","#BBA24C","#AA8C56","#8D6E35","#64481F"),
                    shakira=c("#48654D","#F7E598","#260e05","#6F6D46","#96A8B6","#941d2a","#8F9277","#BB7B84","#C54F46"),
                    wyy=c("#272729","#A92624","#C3BBAA","#5B2127","#5D6F73","#AC9F89","#555551","#8C7A5C","#B19994")
)


# 2. Palette builder function
#::::::::::::::::::::::::::::::::::::::::::::::

#' Latin Palette Generator.
#'
#' This function builds palettes based on album covers by a selection of latin artists. The selection has been subjectively made by the author, my apologies. Almost all palettes, except for \code{ozuna} and \code{rosalia}, have been checked for color blind safety using \href{https://gka.github.io/palettes/#/9|s|00429d,96ffea,ffffe0|ffffe0,ff005e,93003a|1|1}{Chroma.js Color Palette Helper}.
#'
#'  @param name Name of the color palette. Current options are \code{aventura}, \code{badbunny1}, \code{badbunny2}, \code{badgyal}, \code{beckyg}, \code{calle13}, \code{daddy1}, \code{daddy2}, \code{don}, \code{ivyqueen}, \code{karolg}, \code{natti}, \code{nicky}, \code{ozuna}, \code{planb}, \code{rosalia}, \code{shakira}, \code{wyy}.
#'
#'  @param n Number of colors to be used. Each palette includes up to 9 colors for discrete palettes. Any \code{n} can be chosen for continuous palettes.
#'
#'  @param type Usage of palette as "continuous" or "discrete". Continuous palettes interpolate the three first colors of the palette to create a gradient. If not specified, function assumes continuous if n>9 and discrete if n<9.
#'
#'  @return A vector of \code{n} colors
#'
#'  @examples
#'  latin_palette("rosalia",n=50,type="continuous")
#'  latin_palette("daddy1",5)
#'  latin_palette("badgyal",100)
#'
#' @export

latin_palette <- function(name, n, type = c("discrete", "continuous")) {

  pal <- name


  if (is.null(pal)){
    stop("Palette not found.")
  }

  if (missing(n)) {
    n <- length(pal)
  }

  if (missing(type)) {
    if(n > length(pal)){type <- "continuous"}
    else{ type <- "discrete"}
  }
  type <- match.arg(type)


  if (type == "discrete" && n > length(pal)) {
    stop("Number of requested colors greater than what discrete palette can offer, \n  use as continuous instead.")
  }


  out <- switch(type,
                continuous = grDevices::colorRampPalette(pal[1:3])(n),
                discrete = pal[c(1:n)],
  )
  structure(out, class = "latinpalette", name = name)

}




