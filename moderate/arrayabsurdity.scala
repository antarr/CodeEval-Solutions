
object Main extends App {
  val source = scala.io.Source.fromFile(args(0))
  val lines = source.getLines.filter(_.length > 0)
  for (l <- lines) {
    val pattern = """\d+""".r
    val xs = (pattern findAllIn l).toList.sorted
    val dup = (for( (a,b) <- xs zip xs.tail if a==b) yield b).head
    println(dup)
  }
}
