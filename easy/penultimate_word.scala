object Main extends App {
  val source = scala.io.Source.fromFile(args(0))
  val lines = source.getLines.filter(_.length > 0)
  for (l <- lines) {
    val matching = "[A-Za-z0-9]+".r.findAllIn(l).toList
    println(matching(matching.length -2))
  }
}
