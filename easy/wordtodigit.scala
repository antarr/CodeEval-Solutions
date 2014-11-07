object Main extends App {
  val numbers = List("zero","one","two","three","four","five","six","seven","eight","nine").zipWithIndex.toMap
  val source = scala.io.Source.fromFile(args(0))
  val lines = source.getLines.filter(_.length > 0)
  for (l <- lines) {
    println(wordsToNumberString(l))
  }
  def wordsToNumberString(input: String): String ={
    (for(w <- input.split(";").toList) yield numbers(w).toInt).mkString
  }
  
}
