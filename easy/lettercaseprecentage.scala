object Main extends App {
  def letterPercentage(str: String): String ={

    def loop(uppers: Double, lowers: Double, str: String): String = {
      if(str.isEmpty){
        val upPer = lowers/(uppers+lowers)*100
        val lowPer = 100-upPer
        return f"lowercase: $upPer%.2f uppercase: $lowPer%.2f"
        }
      if(str.head.toString.matches("[A-Z]")) loop(uppers + 1, lowers, str.tail)
      else loop(uppers, lowers + 1, str.tail)
    }
    loop(0.00,0.00,str.trim)
  }

  val source = scala.io.Source.fromFile(args(0))
  val lines = source.getLines.filter(_.length > 0)
  for (l <- lines) {
    val percentage = letterPercentage(l)
    println(percentage)
  }
}
