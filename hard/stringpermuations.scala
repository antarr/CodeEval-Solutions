object Main extends App {
  val source = scala.io.Source.fromFile(args(0))
  val lines = source.getLines.filter(_.length > 0)
  for (l <- lines) {
    val str = l.permutations.toArray.sortWith(_ < _).mkString(",")
    println(str)
  }
}
