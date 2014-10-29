object Main extends App {
  val source = scala.io.Source.fromFile(args(0))
  val lines = source.getLines.filter(_.length > 0)
  for (l <- lines) {
  val alphabet = ('a' to 'z').toSet
  val sentence = l.toLowerCase.toSet
  val missing = ((for( c <- alphabet if sentence.contains(c) == false) yield c)).toList.sorted
  if(missing.isEmpty)
    println("NULL")
  else
    println (missing mkString)
  }
}
