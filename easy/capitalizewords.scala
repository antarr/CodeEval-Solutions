object Main extends App {
  val source = scala.io.Source.fromFile(args(0))
  val lines = source.getLines.filter(_.length > 0)
  for (l <- lines) {
      println("[A-Za-z0-9]+".r.findAllIn(l).toList.map( _.capitalize).mkString(" "))
    }
}
